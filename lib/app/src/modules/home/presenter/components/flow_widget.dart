import 'package:flutter/material.dart';
import '../../../../../../prestars_exports.dart';

class FlowWidget extends StatelessWidget {
  const FlowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: context.isDesktop ? 400 : 1500),
      child: Flex(
        direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlowCard(
              image: ThemeService.images.flowOne,
              title: ConstantsStrings.flowTitleOne,
              step: ConstantsStrings.flowStepOne),
          FlowCard(
              image: ThemeService.images.flowTwo,
              title: ConstantsStrings.flowTitleTwo,
              step: ConstantsStrings.flowStepTwo),
          FlowCard(
              image: ThemeService.images.flowThree,
              title: ConstantsStrings.flowTitleThree,
              step: ConstantsStrings.flowStepThree),
          FlowCard(
              image: ThemeService.images.flowFour,
              title: ConstantsStrings.flowTitleFour,
              step: ConstantsStrings.flowStepFour)
        ],
      ),
    );
  }
}
