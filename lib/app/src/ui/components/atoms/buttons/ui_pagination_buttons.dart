import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../prestars_exports.dart';

class UiPaginationButtons extends StatelessWidget {
  final int currentPage;
  final int lastPage;
  final VoidCallback nextPagePressed;
  final VoidCallback previousPagePressed;
  final Function(int value) changePagePressed;
  const UiPaginationButtons(
      {super.key,
      required this.currentPage,
      required this.lastPage,
      required this.nextPagePressed,
      required this.previousPagePressed,
      required this.changePagePressed});

  @override
  Widget build(BuildContext context) {
    return (lastPage == 1)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiPaginationButton(
                  onTap: () {},
                  isCurrent: true,
                  child: AutoSizeText(
                    (1).toString(),
                    style: ThemeService.styles
                        .paginationButton(color: ThemeService.colors.white),
                  )),
            ],
          )
        : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (currentPage != 1)
              UiPaginationButton(
                  onTap: () => previousPagePressed(),
                  isCurrent: false,
                  child: Icon(Icons.keyboard_arrow_left,
                      color: ThemeService.colors.border)),
            if (currentPage != 1)
              UiPaginationButton(
                  onTap: () => changePagePressed(1),
                  isCurrent: false,
                  child: AutoSizeText(
                    1.toString(),
                    style: ThemeService.styles.paginationButton(),
                  )),
            if ((lastPage > 3 && currentPage > 3))
              AutoSizeText('...', style: ThemeService.styles.paginationBalls()),
            if (currentPage > 2)
              UiPaginationButton(
                  onTap: () => previousPagePressed(),
                  isCurrent: false,
                  child: AutoSizeText(
                    (currentPage - 1).toString(),
                    style: ThemeService.styles.paginationButton(),
                  )),
            UiPaginationButton(
                onTap: () {},
                isCurrent: true,
                child: AutoSizeText(
                  currentPage.toString(),
                  style: ThemeService.styles
                      .paginationButton(color: ThemeService.colors.white),
                )),
            if (lastPage >= 2 &&
                currentPage != lastPage &&
                currentPage != lastPage - 1 &&
                currentPage != 2)
              UiPaginationButton(
                  onTap: () => nextPagePressed(),
                  isCurrent: false,
                  child: AutoSizeText(
                    (currentPage + 1).toString(),
                    style: ThemeService.styles.paginationButton(),
                  )),
            if ((currentPage < 3) && lastPage > 3)
              AutoSizeText('...', style: ThemeService.styles.paginationBalls()),
            if (currentPage != lastPage - 2 &&
                currentPage != lastPage - 1 &&
                currentPage != lastPage &&
                currentPage > 2)
              AutoSizeText('...', style: ThemeService.styles.paginationBalls()),
            if (lastPage >= 2 && currentPage != lastPage)
              UiPaginationButton(
                  onTap: () => changePagePressed(lastPage),
                  isCurrent: false,
                  child: AutoSizeText(
                    (lastPage).toString(),
                    style: ThemeService.styles.paginationButton(),
                  )),
            if (currentPage != lastPage)
              UiPaginationButton(
                  onTap: () => nextPagePressed(),
                  isCurrent: false,
                  child: Icon(Icons.keyboard_arrow_right,
                      color: ThemeService.colors.border)),
          ]);
  }
}
