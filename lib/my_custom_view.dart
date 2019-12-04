import 'package:flutter/material.dart';
import 'mycustom.dart';
class MyCustomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
             title: Text('test'),

           ),
      body: CustomPaint(
        painter: MyCustom(),
        child: Container(

        ),
      ),
    );
  }
}
