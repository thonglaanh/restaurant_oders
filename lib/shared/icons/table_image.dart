import 'package:flutter/material.dart';
import 'package:untitled/shared/icons/base/png_icon.dart';

class TableImage extends StatelessWidget {
  final double? width;
  final String assetName;
  final Color? color;

  const TableImage({
    super.key,
    this.width,
    this.color,
    this.assetName = 'table',
  });

  @override
  Widget build(BuildContext context) {
    return PngIcon(
      assetName: assetName,
      width: width,
    );
  }
}
