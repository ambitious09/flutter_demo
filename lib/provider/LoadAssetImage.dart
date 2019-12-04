import 'package:flutter/material.dart';

class LoadAssetImage extends StatelessWidget {

  const LoadAssetImage(this.image, {
    Key key,
    this.width,
    this.height,
    this.fit,
    this.format: 'png',
    this.color
  }): super(key: key);

  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final String format;
  final Color color;

  @override
  Widget build(BuildContext context) {
      print("$image");
    return Image.asset(
      "$image",
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }
}
