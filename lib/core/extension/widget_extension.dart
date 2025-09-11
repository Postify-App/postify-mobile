import 'package:flutter/material.dart';
import 'package:postify/core/extension/context_extension.dart';
import '../routes/app_routers_import.dart';

extension WidgetExtension on Widget {
  Widget withRotatedBox() => RotatedBox(
    quarterTurns: AppRouters.navigatorKey.currentContext!.isRTL() ? 0 : 2,
    child: this,
  );
}
