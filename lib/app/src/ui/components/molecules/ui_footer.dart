import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../prestars_exports.dart';

class UiFooter extends StatelessWidget {
  const UiFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.isDesktop ? 160 : 400,
      color: ThemeService.colors.primary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Flex(
          direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AutoSizeText('PRESTARS',
                      style: ThemeService.styles.exo2LightTitle()),
                  AutoSizeText('©2023 Bit-s Studios. All rights reserved.',
                      style: ThemeService.styles.exo2LightBody()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: ThemeService.colors.white,
                width: context.isDesktop ? 2 : 0,
                height: context.isDesktop ? 0 : 2,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText('Entre em contato',
                      style: ThemeService.styles.exo2LightTitle()),
                  Row(
                    children: [
                      Icon(Icons.email, color: ThemeService.colors.white),
                      AutoSizeText('contato@prestars.com',
                          style: ThemeService.styles.exo2LightBody()),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: ThemeService.colors.white,
                width: context.isDesktop ? 2 : 0,
                height: context.isDesktop ? 0 : 2,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText('Siga-nos nas redes sociais',
                      style: ThemeService.styles.exo2LightTitle()),
                  // Row(
                  //   children: [
                  //     ThemeService.icons.facebookIcon,
                  //     AutoSizeText('/prestars',
                  //         style: ThemeService.styles.exo2LightBody()),
                  //   ],
                  // ),
                  Row(
                    children: [
                      ThemeService.icons.instagramIcon,
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => OpenInstagram.call(),
                          child: AutoSizeText('/prestars_',
                              style: ThemeService.styles.exo2LightBody()),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     ThemeService.icons.linkedinIcon,
                  //     AutoSizeText('/prestars',
                  //         style: ThemeService.styles.exo2LightBody()),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
