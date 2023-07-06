import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../prestars_exports.dart';

class UiSkeletonImage extends StatelessWidget {
  final double? height;
  final double? width;
  const UiSkeletonImage({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ThemeService.colors.terciary,
      highlightColor: ThemeService.colors.terciary,
      enabled: true,
      child: Container(
        height: height ?? 54,
        width: width ?? 54,
        decoration: BoxDecoration(
          color: ThemeService.colors.terciary,
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }
}
