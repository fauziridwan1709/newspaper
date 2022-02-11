import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newspaper/core/theme/base_colors.dart';
import 'package:newspaper/core/theme/font_theme.dart';
import 'package:newspaper/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final rubik10w400black1 = FontTheme.rubik10w400black1();

  final rubik12w400black1 = FontTheme.rubik12w400black1();

  final rubik14w400black1 = FontTheme.rubik14w400black1();

  final rubik14w400neutral = FontTheme.rubik14w400neutral();

  final rubik16w400neutral = FontTheme.rubik16w400neutral();

  final rubik16w400black1 = FontTheme.rubik16w400black1();

  final rubik10w500black1 = FontTheme.rubik10w500black1();

  final rubik12w500black1 = FontTheme.rubik12w500black1();

  final rubik14w500black1 = FontTheme.rubik14w500black1();

  final rubik16w500black1 = FontTheme.rubik16w500black1();

  final rubik18w500black1 = FontTheme.rubik18w500black1();

  final rubik20w500black1 = FontTheme.rubik20w500black1();

  final rubik14w400black4 = FontTheme.rubik14w400black4();

  final rubik16w400black4 = FontTheme.rubik16w400black4();

  final rubik14w500white1 = FontTheme.rubik14w500white1();

  setUpAll(() {
    SharedPreferences.setMockInitialValues({});
    SharedPreferencesService.init();
  });

  group('Test font theme', () {
    test('rubik10w400black1 ', () async {
      expect(rubik10w400black1, isA<TextStyle>());
      expect(rubik10w400black1.fontSize, 10);
      expect(rubik10w400black1.fontWeight, FontWeight.w400);
      expect(rubik10w400black1.color, BaseColors.black);
    });

    test('rubik12w400black1', () async {
      expect(rubik12w400black1, isA<TextStyle>());
      expect(rubik12w400black1.fontSize, 12);
      expect(rubik12w400black1.fontWeight, FontWeight.w400);
      expect(rubik12w400black1.color, BaseColors.black);
    });

    test('rubik14w400black1', () async {
      expect(rubik14w400black1, isA<TextStyle>());
      expect(rubik14w400black1.fontSize, 14);
      expect(rubik14w400black1.fontWeight, FontWeight.w400);
      expect(rubik14w400black1.color, BaseColors.black);
    });

    test('rubik14w400neutral', () async {
      expect(rubik14w400neutral, isA<TextStyle>());
      expect(rubik14w400neutral.fontSize, 14);
      expect(rubik14w400neutral.fontWeight, FontWeight.w400);
      expect(rubik14w400neutral.color, BaseColors.neutral90);
    });

    test('rubik16w400neutral', () async {
      expect(rubik16w400neutral, isA<TextStyle>());
      expect(rubik16w400neutral.fontSize, 16);
      expect(rubik16w400neutral.fontWeight, FontWeight.w400);
      expect(rubik16w400neutral.color, BaseColors.neutral90);
    });

    test('rubik16w400black1', () async {
      expect(rubik16w400black1, isA<TextStyle>());
      expect(rubik16w400black1.fontSize, 16);
      expect(rubik16w400black1.fontWeight, FontWeight.w400);
      expect(rubik16w400black1.color, BaseColors.black);
    });

    test('rubik10w500black1', () async {
      expect(rubik10w500black1, isA<TextStyle>());
      expect(rubik10w500black1.fontSize, 10);
      expect(rubik10w500black1.fontWeight, FontWeight.w500);
      expect(rubik10w500black1.color, BaseColors.black);
    });

    test('rubik12w500black1', () async {
      expect(rubik12w500black1, isA<TextStyle>());
      expect(rubik12w500black1.fontSize, 12);
      expect(rubik12w500black1.fontWeight, FontWeight.w500);
      expect(rubik12w500black1.color, BaseColors.black);
    });

    test('rubik14w500black1', () async {
      expect(rubik14w500black1, isA<TextStyle>());
      expect(rubik14w500black1.fontSize, 14);
      expect(rubik14w500black1.fontWeight, FontWeight.w500);
      expect(rubik14w500black1.color, BaseColors.black);
    });

    test('rubik16w500black1', () async {
      expect(rubik16w500black1, isA<TextStyle>());
      expect(rubik16w500black1.fontSize, 16);
      expect(rubik16w500black1.fontWeight, FontWeight.w500);
      expect(rubik16w500black1.color, BaseColors.black);
    });

    test('rubik18w500black1', () async {
      expect(rubik18w500black1, isA<TextStyle>());
      expect(rubik18w500black1.fontSize, 18);
      expect(rubik18w500black1.fontWeight, FontWeight.w500);
      expect(rubik18w500black1.color, BaseColors.black);
    });

    test('rubik20w500black1', () async {
      expect(rubik20w500black1, isA<TextStyle>());
      expect(rubik20w500black1.fontSize, 20);
      expect(rubik20w500black1.fontWeight, FontWeight.w500);
      expect(rubik20w500black1.color, BaseColors.black);
    });

    test('rubik14w400black4', () async {
      expect(rubik14w400black4, isA<TextStyle>());
      expect(rubik14w400black4.fontSize, 14);
      expect(rubik14w400black4.fontWeight, FontWeight.w400);
      expect(rubik14w400black4.color, BaseColors.neutral70);
    });

    test('rubik16w400black4', () async {
      expect(rubik16w400black4, isA<TextStyle>());
      expect(rubik16w400black4.fontSize, 16);
      expect(rubik16w400black4.fontWeight, FontWeight.w400);
      expect(rubik16w400black4.color, BaseColors.neutral70);
    });

    test('rubik14w500white1', () async {
      expect(rubik14w500white1, isA<TextStyle>());
      expect(rubik14w500white1.fontSize, 14);
      expect(rubik14w500white1.fontWeight, FontWeight.w500);
      expect(rubik14w500white1.color, BaseColors.white);
    });
  });
}
