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
    return BasePage(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.08),
        body: ValueListenableBuilder<int>(
            valueListenable: controller,
            builder: (context, value, child) => const AthletePage()));
  }
}
