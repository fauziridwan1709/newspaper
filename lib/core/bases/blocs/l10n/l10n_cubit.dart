import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  /// {@macro brightness_cubit}
  LocaleCubit() : super(const Locale('id', ''));

  /// Toggles the current locale between en and id.
  void toggleLocale() {
    emit(
      state.languageCode == 'en'
          ? const Locale('id', '')
          : const Locale('en', ''),
    );
  }
}
