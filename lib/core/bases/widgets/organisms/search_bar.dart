import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newspaper/core/bases/decorators/input_decorator.dart';
import 'package:newspaper/core/extensions/build_context_extension.dart';
import 'package:newspaper/core/theme/font_theme.dart';

class NewsSearchBar extends StatelessWidget {
  const NewsSearchBar({
    Key? key,
    required this.controller,
    this.onChanged,
    this.hintText,
    this.padding,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String val)? onChanged;
  final String? hintText;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: FontTheme.rubik14w400black1().copyWith(
          color: theme.cardColor,
        ),
        decoration: TextInputDecorator.searchBar().copyWith(
          fillColor: theme.inputDecorationTheme.fillColor,
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              'assets/icons/fi_search.svg',
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
    );
  }
}
