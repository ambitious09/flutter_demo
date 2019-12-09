import 'package:flutter/material.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'dart:async';
import 'package:flutter/services.dart';
class JpushDemo extends StatefulWidget {
  @override
  _JpushDemoState createState() => _JpushDemoState();
}

class _JpushDemoState extends State<JpushDemo> {
  final JPush _jPush=new JPush();
  MethodChannel  methodchanel= new MethodChannel("com.demo");

  String debugLable="unknown";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatForm();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("jspush"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("结果=${debugLable}"),
            FlatButton(
                onPressed: (){
                  var fireDate=DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch+3000);
                  var jsnotification=LocalNotification(id: 123, title: "这是一个测试",buildId: 1, content: "主要内容", fireTime: fireDate);
                  _jPush.sendLocalNotification(jsnotification).then((res){
                   setState(() {
                     debugLable=res;
                   });
                  });
                },
                child: Text("点击推送"))
          ],
        ),
      ),
    );
  }

  Future<void> initPlatForm() {
    String platformVersion;
    try{
      _jPush.addEventHandler(
          onReceiveMessage: (Map<String, dynamic> message) async {

          },
          onOpenNotification: (Map<String, dynamic> message) async {
            print("点击通知栏");
            methodchanel.invokeListMethod("flutter", "secondeActivity");
          },
          onReceiveNotification: (Map<String, dynamic> message) async {
            setState(() {
              debugLable = "接收到推送: $message";
            });
            print("message=$message");
          }
      );
    }on PlatformException{
      platformVersion = '平台版本获取失败，请检查！';
    }
    _jPush.setup(
      appKey: "8fd2d3817c1aa94476be02d1",
      channel: "theChannel",
      production: true,
      debug: true, // 设置是否打印 debug 日志
    );
    _jPush.getRegistrationID().then((rid) {
      print("getRegistrationID:" + rid);
    });
//    iOS10+ 可以通过该方法来设置推送是否前台展示，是否触发声音，是否设置应用角标 badge
    _jPush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));

    _jPush.setup(
        appKey: "8fd2d3817c1aa94476be02d1",
        channel: "ios");
    if (mounted) {
      setState(() {
        debugLable = platformVersion;
      });
    }

  }
}

