import 'package:flutter/material.dart';
import '../../custom_widgets/offline_widget/offline_widget.dart';
import '../../network/app_interceptors.dart';
import '../../enum/cubit_state/cubit_status.dart';
import '../custom_loading/custom_loading.dart';
import '../exception_widget/exception_widget.dart';
import '../no_data_widget/no_data_widget.dart';

class ApiResponseWidget extends StatelessWidget {
  final CubitStatus cubitState;
  final Widget child;
  final double loadingSize;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget? unauthorizedWidget;
  final Widget? offlineWidget;
  final bool isEmpty;
  final bool initialChild;
  final void Function()? onReload;
  final Axis axis;
  final String? noDataMessage;
  final String? exceptionMessage;
  final Color? loadingColor;

  const ApiResponseWidget({
    super.key,
    required this.cubitState,
    required this.child,
    required this.onReload,
    required this.isEmpty,
    this.loadingSize = 35,
    this.loadingWidget,
    this.axis = Axis.vertical,
    this.noDataMessage,
    this.exceptionMessage,
    this.errorWidget,
    this.emptyWidget,
    this.offlineWidget,
    this.loadingColor,
    this.unauthorizedWidget,
    this.initialChild = false,
  });

  //! Factory constructor for sliver version
  factory ApiResponseWidget.sliver({
    required CubitStatus cubitState,
    required Widget sliverChild,
    required void Function()? onReload,
    required bool isEmpty,
    double loadingSize = 35,
    Widget? loadingWidget,
    Axis axis = Axis.vertical,
    String? noDataMessage,
    String? exceptionMessage,
    Widget? errorWidget,
    Widget? emptyWidget,
    Widget? offlineWidget,
    Color? loadingColor,
    Widget? unauthorizedWidget,
    bool initialChild = false,
  }) {
    return ApiResponseWidget(
      cubitState: cubitState,
      onReload: onReload,
      isEmpty: isEmpty,
      loadingSize: loadingSize,
      loadingWidget:
          loadingWidget ?? _buildSliverLoading(loadingSize, loadingColor),
      axis: axis,
      noDataMessage: noDataMessage,
      exceptionMessage: exceptionMessage,
      errorWidget:
          errorWidget ?? _buildSliverError(onReload, axis, exceptionMessage),
      emptyWidget: emptyWidget ?? _buildSliverEmpty(axis, noDataMessage),
      offlineWidget: offlineWidget ?? _buildSliverOffline(onReload, axis),
      loadingColor: loadingColor,
      unauthorizedWidget: unauthorizedWidget,
      initialChild: initialChild,
      child: sliverChild,
    );
  }

  static Widget _buildSliverLoading(double size, Color? color) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CustomLoading(size: size, color: color),
      ),
    );
  }

  static Widget _buildSliverError(
    void Function()? onReload,
    Axis axis,
    String? message,
  ) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: ExceptionWidget(
          message: message,
          axis: axis,
          onReload: onReload,
        ),
      ),
    );
  }

  static Widget _buildSliverEmpty(Axis axis, String? message) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: NoDataWidget(message: message, axis: axis),
      ),
    );
  }

  static Widget _buildSliverOffline(void Function()? onReload, Axis axis) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: OfflineWidget(onReload: onReload, axis: axis),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (cubitState) {
      case CubitStatus.initial:
        if (initialChild) {
          return child;
        } else {
          return const SizedBox();
        }
      case CubitStatus.loading:
        return loadingWidget ??
            Center(
              child: CustomLoading(size: loadingSize, color: loadingColor),
            );
      case CubitStatus.success:
        if (isEmpty) {
          return emptyWidget ??
              Center(
                child: NoDataWidget(message: noDataMessage, axis: axis),
              );
        } else {
          return child;
        }
      case CubitStatus.failure:
        if (AppInterceptors.isInternet == false) {
          return Center(
            child:
                offlineWidget ?? OfflineWidget(onReload: onReload, axis: axis),
          );
        }
        return errorWidget ??
            Center(
              child: ExceptionWidget(
                message: exceptionMessage,
                axis: axis,
                onReload: onReload,
              ),
            );
    }
  }
}
