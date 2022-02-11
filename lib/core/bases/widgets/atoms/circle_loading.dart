import 'package:flutter/material.dart';
import 'package:newspaper/core/extensions/build_context_extension.dart';

/// A circle loading widget.
class CircleLoading extends StatelessWidget {
  /// Creates a circle loading with default size 35.
  const CircleLoading({
    Key? key,
    this.size = 35.0,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(theme.cardColor),
          ),
        ),
      ),
    );
  }
}
