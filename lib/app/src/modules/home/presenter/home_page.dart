import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../prestars_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = GetIt.I.get<HomeController>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return context.isDesktop
        ? BasePage(
            maxHeight: context.height * 0.9,
            maxWidth: context.width * 0.9,
            body: ValueListenableBuilder<HomeState>(
                valueListenable: controller,
                builder: (context, value, child) {
                  if (value is SuccessHome) {
                    return const Column(
                      children: [
                       
                        SizedBox(height: 22),
                      ],
                    );
                  } else {
                    return SizedBox(
                      height: context.height * 0.8,
                      child: UiLoading(
                        color: ThemeService.colors.primary,
                      ),
                    );
                  }
                }))
        : Scaffold(
            body: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: ThemeService.colors.backgroundGradient),
              child: SingleChildScrollView(
                child: ValueListenableBuilder<HomeState>(
                    valueListenable: controller,
                    builder: (context, value, child) {
                      if (value is SuccessHome) {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 34),
                           
                            SizedBox(height: 22),
                          ],
                        );
                      } else if (value is ErrorInitHome) {
                        context.go(ConstantsRoutes.root);
                        return const UiLoading();
                      } else {
                        return const UiLoading();
                      }
                    }),
              ),
            ),
          );
  }
}
