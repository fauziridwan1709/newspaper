import 'package:flutter/material.dart';
import 'package:newspaper/core/bases/widgets/atoms/sizer.dart';

/// A Height Size Widget
class HeightSize extends StatelessWidget implements Sizer {
  /// Creates Height Size Widget.
  const HeightSize(
    this.size, {
    Key? key,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: getSize());
  }

  @override
  double getSize() {
    return size;
  }
}
