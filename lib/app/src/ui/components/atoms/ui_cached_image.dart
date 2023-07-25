import 'package:flutter/material.dart';

class UiCachedImage extends StatefulWidget {
  final String image;
  const UiCachedImage({super.key, required this.image});

  @override
  State<UiCachedImage> createState() => _UiCachedImageState();
}

class _UiCachedImageState extends State<UiCachedImage> {
  late Image imageProvider;
  @override
  void initState() {
    super.initState();
    imageProvider = Image.asset(widget.image);
  }

  @override
  void didChangeDependencies() async {
    await precacheImage(imageProvider.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: imageProvider.image, fit: BoxFit.cover),
      ),
    );
  }
}
