import 'package:flutter/material.dart';
import 'package:flutter_demo/hero_demo/second_page.dart';
import 'package:flutter/foundation.dart';
class HeroOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("first"),
        ),
      body: Container(
        alignment: Alignment.topCenter,
      child:InkWell(
        child: Hero(
            tag: "kip",
            child: ClipOval(
              child: Image.asset("images/ic_head.png"),
            ),
            transitionOnUserGestures: defaultTargetPlatform==TargetPlatform.android?false:true,
        ),
        onTap: (){
          Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,Animation ani,Animation second){
            return FadeTransition(
              opacity: ani,
              child:  SecondPage(),

              );
          }));
        },
      ),
      ),

    );
  }
}
