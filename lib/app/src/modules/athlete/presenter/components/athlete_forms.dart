import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prestarts_site/app/_exports.dart';
import 'package:get_it/get_it.dart';

class AthleteForms extends StatelessWidget {
  const AthleteForms({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<AthleteController>();
    return Flexible(
      child: Container(
        height: context.isDesktop ? null : context.height * 3.2,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: ThemeService.colors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Flex(
          direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
          children: [
            Flexible(
                flex: context.isDesktop ? 10 : 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Formulário para inscrição',
                      style: ThemeService.styles.exo2LightTitle(size: 32),
                      maxFontSize: 32,
                      minFontSize: 24,
                      maxLines: 4,
                    ),
                    BasicForms(controller: controller)
                  ],
                )),
            const Spacer(),
            Flexible(
                flex: 10,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: DataForms(controller: controller),
                ))
          ],
        ),
      ),
    );
  }
}
