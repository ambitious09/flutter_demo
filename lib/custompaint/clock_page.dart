import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/custompaint/clock_paint.dart';

class ClockPage extends StatefulWidget {
  final double radius;
  final Color hourHandColor;
  final Color minuteHandColor;
  final Color secondHandColor;
  final Color numberColor;
  final Color borderColor;

  const ClockPage({Key key, this.radius=150.0, this.hourHandColor, this.minuteHandColor, this.secondHandColor, this.numberColor, this.borderColor}) : super(key: key);

  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  DateTime datetime;
  Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datetime=DateTime.now();
//    timer=Timer.periodic(Duration(seconds: 1), (time){
//      setState(() {
//        datetime=DateTime.now();
//      });
//    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义时钟"),
      ),
      body: CustomPaint(painter: ClockPaint(datetime,
        numberColor: Colors.black,
        handColor: Colors.black,
        borderColor: Colors.black,
        radius: widget.radius,
      ),
          size: Size(widget.radius * 2, widget.radius * 2)
      ),
    );
  }
}
