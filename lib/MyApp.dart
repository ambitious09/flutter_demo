import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/my_custom_view.dart';

class MyApp extends StatelessWidget {
  final ThemeData themeData=ThemeData(
      primarySwatch: Colors.purple,
      primaryColor: Colors.grey[100],
      accentColor: Colors.green[100],
      primaryColorBrightness: Brightness.light
  );
  // 默认主题
  final ThemeData kDefaultTheme = new ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.orangeAccent[400],

  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:defaultTargetPlatform==TargetPlatform.iOS?themeData:kDefaultTheme,
      home: MyCustomView() ,
    );
  }
}