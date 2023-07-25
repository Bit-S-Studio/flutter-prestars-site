import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../prestars_exports.dart';

class AthleteOne extends StatelessWidget {
  const AthleteOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: context.isDesktop ? 380 : 800),
      child: Flex(
        direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 6,
            child: UiCachedImage(image: ThemeService.images.athleteOne),
          ),
          const Spacer(flex: 1),
          Flexible(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Flexible(
                    child: UiEmphasisText(
                        textStart: 'Mostre a ',
                        textEmphasis: 'estrela ',
                        textFinish: 'que brilha em você!')),
                Flexible(
                  child: AutoSizeText(
                    'Cadastre-se em nossa plataforma, mostre suas atuações e o quanto você pode brilhar em uma equipe de grande porte',
                    maxFontSize: 30,
                    minFontSize: 18,
                    maxLines: 4,
                    style: ThemeService.styles.exo2Subtitle(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
