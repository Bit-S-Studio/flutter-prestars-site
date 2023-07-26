import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../prestars_exports.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: context.isDesktop ? 80 : 60),
          const Flexible(
            child: UiEmphasisText(
                textStart: 'Está procurando sua nova ',
                textEmphasis: 'estrela',
                textFinish: '? Nós podemos te ajudar!'),
          ),
          SizedBox(height: context.isDesktop ? 80 : 60),
          const AthleteOne(),
          SizedBox(height: context.isDesktop ? 80 : 60),
          const AthleteTwo(),
          SizedBox(height: context.isDesktop ? 80 : 60),
          const AthleteThree(),
          SizedBox(height: context.isDesktop ? 80 : 60),
          Flexible(
            child: AutoSizeText(
              'Fluxo de captação com o PRESTARS',
              maxFontSize: 60,
              minFontSize: 32,
              style: ThemeService.styles.exo2Title(),
            ),
          ),
          SizedBox(height: context.isDesktop ? 80 : 60),
          const FlowWidget(),
          SizedBox(height: context.isDesktop ? 80 : 60),
          const Flexible(
            child: UiEmphasisText(
                textStart: 'Se cadastra aí e se torne um ',
                textEmphasis: 'PRE',
                textFinish: 'STAR'),
          ),
          SizedBox(height: context.isDesktop ? 80 : 60),
          const AthleteForms(),
          SizedBox(height: context.isDesktop ? 80 : 60),
        ],
      ),
    );
  }
}
