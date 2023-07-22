import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prestarts_site/app/_exports.dart';

class UiCachedImage extends StatelessWidget {
  final String image;
  const UiCachedImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
        color: ThemeService.colors.primary,
      )),
      errorWidget: (context, url, error) => Text(error),
    );
  }
}
