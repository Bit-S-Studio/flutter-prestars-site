import 'package:flutter/material.dart';
import '../../../../../prestars_exports.dart';

class BasePage extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? maxWidth;
  final double? maxHeight;
  final bool greyBackgroud;
  final Widget? topWidget;
  final Widget? bottomWidget;
  const BasePage(
      {Key? key,
      required this.child,
      this.maxWidth,
      this.maxHeight,
      this.padding,
      this.greyBackgroud = false,
      this.topWidget,
      this.bottomWidget})
      : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage>
    with AutomaticKeepAliveClientMixin<BasePage> {
  late ScrollController scrollController;
  late BaseNavigatorController baseNavigatorController;

  @override
  void initState() {
    scrollController = ScrollController();
    baseNavigatorController = BaseNavigatorController();
    baseNavigatorController.init();
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.colors.background,
      appBar: UiHeader.call(context, scrollController, baseNavigatorController),
      body: SizedBox(
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
