import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../prestars_exports.dart';
import 'package:flutter/material.dart';

class UiAvatar extends StatelessWidget {
  final String? photoUrl;
  final String? name;
  final double? size;
  final bool hasBorder;
  final double? borderSize;
  const UiAvatar(
      {Key? key,
      this.photoUrl,
      this.name,
      this.size,
      this.hasBorder = false,
      this.borderSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color randomColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Card(
      margin: EdgeInsets.zero,
      elevation: 3,
      shape: const CircleBorder(),
      child: ClipOval(
          child: CachedNetworkImage(
              imageUrl: photoUrl ?? '',
              height: size ?? 40,
              width: size ?? 40,
              fit: BoxFit.cover,
              placeholder: (_, url) =>
                  UiSkeletonImage(height: size ?? 40, width: size ?? 40),
              errorWidget: (_, url, value) => CircleAvatar(
                    radius: hasBorder
                        ? (borderSize ?? size ?? 40) / 2
                        : (size ?? 42) / 2,
                    backgroundColor: ThemeService.colors.white,
                    child: Container(
                      height: size ?? 40,
                      width: size ?? 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (name != null) ? randomColor : null,
                      ),
                      child: (name != null)
                          ? Center(
                              child: AutoSizeText(
                                GetInitialNameLatters.call(name ?? ''),
                                maxFontSize: 28,
                                minFontSize: 12,
                                maxLines: 1,
                                style: ThemeService.styles.montserratBody(
                                    color: ThemeService.colors.white),
                              ),
                            )
                          : Center(
                              child: AutoSizeText(
                                'found_photo',
                                maxLines: 2,
                                minFontSize: 8,
                                maxFontSize: 12,
                                textAlign: TextAlign.center,
                                style: ThemeService.styles.montserratCaption(
                                    size: 6,
                                    color: ThemeService.colors.primary),
                              ),
                            ),
                    ),
                  ))),
    );
  }
}
