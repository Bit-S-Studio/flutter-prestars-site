import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../prestars_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = GetIt.I.get<HomeController>();

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
                textStart: 'Nós acreditamos que existem ',
                textEmphasis: 'estrelas',
                textFinish: 'esperando para brilhar'),
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
