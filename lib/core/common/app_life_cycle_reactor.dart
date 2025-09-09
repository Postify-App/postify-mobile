import 'package:flutter/material.dart';

class AppLifecycleReactor with WidgetsBindingObserver {
  Function(AppLifecycleState state)? onStateChanged;

  AppLifecycleReactor({this.onStateChanged}) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (onStateChanged != null) {
      onStateChanged!(state);
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
