import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../prestars_exports.dart';

class UiImageViewer extends StatelessWidget {
  final double? height;
  final double? width;
  final String? image;
  const UiImageViewer({Key? key, this.height, this.width, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? '',
      height: height ?? 74,
      width: width ?? 74,
      fit: BoxFit.cover,
      placeholder: (_, url) => const UiSkeletonImage(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
