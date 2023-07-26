import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../prestars_exports.dart';

class AthleteTwo extends StatelessWidget {
  const AthleteTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: context.isDesktop ? 380 : 600),
      child: Flex(
        direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Flexible(
                    child: UiEmphasisText(
                        textStart: 'Uma ',
                        textEmphasis: 'estrela ',
                        textFinish: 'precisa de visibilidade')),
                Flexible(
                  child: AutoSizeText(
                    'Adicione seus vídeos postados em outras plataformas, ou novos vídeos, para que os clubes possam te conhecer',
                    maxFontSize: 30,
                    minFontSize: 18,
                    style: ThemeService.styles.exo2Subtitle(),
                  ),
                )
              ],
            ),
          ),
          const Spacer(flex: 1),
          Flexible(
            flex: 6,
            child: UiCachedImage(image: ThemeService.images.athleteTwo),
          ),
        ],
      ),
    );
  }
}
