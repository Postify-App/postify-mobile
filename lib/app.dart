import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/app_routers_import.dart';
import 'core/routes/routes_name.dart';
import 'core/theme/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:country_picker/country_picker.dart';

class Postify extends StatefulWidget {
  const Postify({super.key});

  @override
  State<Postify> createState() => _PostifyState();
}

class _PostifyState extends State<Postify> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          localizationsDelegates: [
            ...context.localizationDelegates,
            CountryLocalizations.delegate,
          ],
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: appThemeData(context),
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          initialRoute: RoutesName.splashScreen,
          onGenerateRoute: AppRouters.onGenerateRoute,
          navigatorKey: AppRouters.navigatorKey,
        );
      },
    );
  }
}
