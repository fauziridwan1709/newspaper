import 'package:flutter/material.dart';
import 'package:newspaper/core/bases/widgets/atoms/sizer.dart';

/// A Area Size Widget.
class AreaSize extends StatelessWidget implements Sizer {
  /// Creates Area Size Widget.
  const AreaSize({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(),
      width: getSize(),
    );
  }

  @override
  double getSize() {
    return size;
  }
}
