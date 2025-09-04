import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postify/core/routes/routes_name.dart';
import 'package:postify/core/utils/common_methods.dart';
import 'package:postify/features/auth/presentation/controller/auth_cubit.dart';

import '../cache/hive/hive_methods.dart';
import '../locale/app_locale_key.dart';
import '../routes/app_routers_import.dart';
import 'status_code.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;
  static bool isInternet = true;
  AppInterceptors(this.dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers['Accept-Language'] = HiveMethods.getLang();
    if (HiveMethods.getAccessToken() != null) {
      options.headers['Authorization'] =
          "Bearer ${HiveMethods.getAccessToken()}";
    }

    // Check internet connectivity before sending request
    if (!await CommonMethods.hasConnection()) {
      isInternet = false;
      return handler.reject(
        DioException(
          requestOptions: options,
          error: 'No Internet Connection',
          type: DioExceptionType.connectionError,
        ),
      );
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );

    if (response.statusCode == StatusCode.unauthorized) {
      HiveMethods.deleteTokens();
      Navigator.of(
        AppRouters.navigatorKey.currentContext!,
      ).pushReplacementNamed(RoutesName.loginScreen);
      return;
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );

    if (err.response?.statusCode == StatusCode.unauthorized &&
        err.response?.data['message'] ==
            'Your access token is invalid or has expired.') {
      try {
        await AppRouters.navigatorKey.currentContext!
            .read<AuthCubit>()
            .refreshToken();
        err.requestOptions.headers['Authorization'] =
            "Bearer ${HiveMethods.getAccessToken()}";
        final retryRequest = await dio.fetch(err.requestOptions);
        return handler.resolve(retryRequest);
      } catch (refreshError) {
        HiveMethods.deleteTokens();
        Navigator.of(
          AppRouters.navigatorKey.currentContext!,
        ).pushReplacementNamed(RoutesName.loginScreen);
        handler.reject(err);
      }
    }

    if (err.type == DioExceptionType.unknown &&
        err.error == 'No Internet Connection') {
      showDialog(
        context: AppRouters.navigatorKey.currentContext!,
        builder: (_) => AlertDialog(
          title: Text(AppLocaleKey.noInternet.tr()),
          content: Text(AppLocaleKey.pleaseCheckYourConnectionAndTryAgain.tr()),
        ),
      );
    }

    return handler.next(err);
  }
}
