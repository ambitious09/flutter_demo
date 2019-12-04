import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';






class AnimatedLogo extends AnimatedWidget{
  static final _opacityTween=Tween<double>(begin: 1.0,end: 1.0);
  static final _SizeTween=Tween<double>(begin: 0.0,end: 300.0);

  AnimatedLogo({Key key,Animation<double> animation}):super(key: key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Opacity(
          opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: _SizeTween.evaluate(animation),
          width: _SizeTween.evaluate(animation),
          child: FlutterLogo(),
        ),

      ),
    );
  }

}
