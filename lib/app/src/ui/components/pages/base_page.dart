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
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
            body: Container(
          decoration:
              BoxDecoration(gradient: ThemeService.colors.backgroundGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (widget.topWidget != null)
                widget.topWidget ?? const SizedBox(),
              Center(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: widget.maxWidth ?? double.infinity,
                        maxHeight: widget.maxHeight ?? double.infinity),
                    child: Card(
                      color: widget.greyBackgroud
                          ? ThemeService.colors.white
                          : null,
                      margin: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: widget.padding ?? const EdgeInsets.all(16),
                          child: widget.body,
                        ),
                      ),
                    )),
              ),
              if (widget.bottomWidget != null)
                widget.bottomWidget ?? const SizedBox()
            ],
          ),
        )));
  }

  @override
  bool get wantKeepAlive => false;
}
