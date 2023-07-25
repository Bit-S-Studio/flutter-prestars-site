import 'package:flutter/material.dart';

import '../../../../../prestars_exports.dart';

class UiHeader {
  static PreferredSizeWidget call(
          BuildContext context, ScrollController scrollController) =>
      AppBar(
        backgroundColor: ThemeService.colors.background,
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: false,
        title: const UiLogo(),
        actions: [
          context.isDesktop
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: UiButton(
                      width: 200,
                      onPressed: () {
                        scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: const Duration(
                              milliseconds:
                                  500), // Duração da animação em milissegundos
                          curve: Curves.easeInOut, // Curva de animação
                        );
                      },
                      label: 'Inscreva-se'),
                )
              : const SizedBox()
        ],
      );
}
