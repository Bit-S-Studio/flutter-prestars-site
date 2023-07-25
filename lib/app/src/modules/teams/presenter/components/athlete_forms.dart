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
                child: BasicForms(controller: controller)),
            context.isDesktop ? const Spacer() : const SizedBox(height: 20),
            Flexible(flex: 10, child: DataForms(controller: controller))
          ],
        ),
      ),
    );
  }
}
