import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../prestars_exports.dart';

class AthleteThree extends StatelessWidget {
  const AthleteThree({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 600),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 2,
              width: context.width * 0.6,
              color: ThemeService.colors.primary),
          const Flexible(
              child: UiEmphasisText(
                  textAlign: TextAlign.center,
                  textStart:
                      'Se você quer ter mais visibilidade, ser conhecido por profissionais do futebol e ter a chance de ganhar ',
                  textEmphasis: 'oportunidades ',
                  textFinish:
                      'de mostrar suas habilidades em clubes profissionais, nossa plataforma é para você.')),
          Flexible(
            child: AutoSizeText(
              'Nossa plataforma ajuda atletas a serem encontrados por clubes profissionais.',
              maxFontSize: 30,
              minFontSize: 18,
              style: ThemeService.styles.exo2Subtitle(),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              height: 2,
              width: context.width * 0.6,
              color: ThemeService.colors.primary),
        ],
      ),
    );
  }
}
