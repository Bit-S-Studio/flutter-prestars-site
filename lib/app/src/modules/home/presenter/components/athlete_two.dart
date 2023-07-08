import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../prestars_exports.dart';

class AthleteTwo extends StatelessWidget {
  const AthleteTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: context.isDesktop ? 340 : 600),
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
                Flexible(
                  child: AutoSizeText(
                    'Grandes estrelas jogam em equipe',
                    maxFontSize: 48,
                    minFontSize: 24,
                    style: ThemeService.styles.exo2Title(),
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    'Se você é aquele professor que acredita no brilho de seus alunos, os indeque para chegar lá',
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
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: AssetImage(ThemeService.images.athleteTwo),
                        fit: BoxFit.contain)),
              )),
        ],
      ),
    );
  }
}
