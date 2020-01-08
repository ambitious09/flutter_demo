
import 'package:flutter/material.dart';
import 'package:flutter_demo/future_demo2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/gestures.dart';

import 'feature_builder.dart';



class DrawDemo extends StatefulWidget {
  @override
  _DrawDemoState createState() => _DrawDemoState();
}

class _DrawDemoState extends State<DrawDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("draw"),
          
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: FutureDemo2(),
          )
        ],
      )
    );
  }
}


class DragContainer extends StatefulWidget {
  @override
  _DragContainerState createState() => _DragContainerState();
}

class _DragContainerState extends State<DragContainer> {
  double offsetDistance = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(0.0,offsetDistance,),
      child: RawGestureDetector(
        gestures: {MyVerticalDragGestureRecognizer: getGesture()},
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      )
    );
  }
  GestureRecognizerFactory<MyVerticalDragGestureRecognizer> getGesture(){
    return GestureRecognizerFactoryWithHandlers(()=>MyVerticalDragGestureRecognizer(),_initiaizer);
  }
  void _initiaizer(MyVerticalDragGestureRecognizer instance){
    instance..onStart = _onStart
        ..onEnd = _onEnd
        ..onUpdate = _onUpdate;
  }
  //接受触摸事件
  void _onStart(DragStartDetails details) {
    print('触摸屏幕${details.globalPosition}');
  }

  ///垂直移动
  void _onUpdate(DragUpdateDetails details) {
    print('垂直移动${details.delta}');
    offsetDistance = offsetDistance + details.delta.dy;
    setState(() {});
  }

  ///手指离开屏幕
  void _onEnd(DragEndDetails details) {
    print('离开屏幕');
  }
}


class  MyVerticalDragGestureRecognizer extends VerticalDragGestureRecognizer{
  MyVerticalDragGestureRecognizer({Object ob}):super(debugOwner:ob);


}
