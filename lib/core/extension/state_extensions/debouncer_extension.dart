import 'package:flutter/widgets.dart';
import 'package:postify/core/common/debouncer.dart';

extension DebouncerExtension on State {
  Debouncer getDebouncer({Duration delay = const Duration(milliseconds: 500)}) {
    return Debouncer(delay: delay);
  }
}
