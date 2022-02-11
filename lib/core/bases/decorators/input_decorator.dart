import 'package:flutter/material.dart';
import 'package:newspaper/core/theme/base_colors.dart';

class TextInputDecorator {
  TextInputDecorator() {
    _inputDecoration = const InputDecoration();
  }

  late InputDecoration _inputDecoration;

  InputDecoration defaultDecoration() {
    return _inputDecoration.copyWith();
  }

  static InputDecoration searchBar() {
    return InputDecoration(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: BaseColors.disableColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: BaseColors.disableColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: BaseColors.primary),
      ),
    );
  }
}
