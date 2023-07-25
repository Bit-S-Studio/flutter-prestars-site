import 'package:flutter/material.dart';
import '../../../../../prestars_exports.dart';

class BasePage extends StatefulWidget {
  final Widget body;
  final EdgeInsets? padding;
  final double? maxWidth;
  final double? maxHeight;
  final bool greyBackgroud;
  final Widget? topWidget;
  final Widget? bottomWidget;
  const BasePage(
      {Key? key,
      required this.body,
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
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          backgroundColor: ThemeService.colors.background,
          appBar:
              UiHeader.call(context, scrollController, baseNavigatorController),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Padding(
                  padding: widget.padding ?? const EdgeInsets.all(16),
                  child: widget.body,
                ),
                const UiFooter(),
              ],
            ),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => false;
}
