import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_demo/customanim/custanim_build.dart';
import 'dart:math';
//import 'package:flutter_demo/customanim/single.dart';


class LogoAnim extends StatefulWidget {
  @override
  _LogoAnimState createState() => _LogoAnimState();
}

class _LogoAnimState extends State<LogoAnim> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double>  _animation;

  @override
  void initState() {
//    lerpDouble()
//  pi*2;
    _controller = AnimationController(duration: const Duration(milliseconds: 3000),vsync: this);
   _animation=CurvedAnimation(parent: _controller, curve: Curves.easeIn)
             ..addStatusListener((status){
               if(status==AnimationStatus.completed){
                 _controller.reverse();
               }else{
                 _controller.forward();
               }
             });
   _controller.forward();

    super.initState();


  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: _animation,);
  }
}

class A{
   const A.raw();
   factory A(){
     return A.raw();
   }
    @override
  bool operator ==(Object other) {

    // TODO: implement ==
    return identical(this, other);
  }
  void log(String name){
//    ModalKey;
  }
}
