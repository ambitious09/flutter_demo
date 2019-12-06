import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/Isolatesdemo/Isolates_demo.dart';
import 'package:flutter_demo/card_demo.dart';
import 'package:flutter_demo/customanim/logo_anim.dart';
import 'package:flutter_demo/custompaint/clock_page.dart';
import 'package:flutter_demo/draw.dart';
import 'package:flutter_demo/draw_demo/drawandsearch.dart';
import 'package:flutter_demo/droplist/drop_list_demo.dart';
import 'package:flutter_demo/glide_demo.dart';
import 'package:flutter_demo/hero_demo/hero_one.dart';
import 'package:flutter_demo/my_custom_view.dart';
import 'package:flutter_demo/navation_demo.dart';
import 'package:flutter_demo/provider/CurrentIndexProvide.dart';
import 'package:flutter_demo/provider/index_app.dart';
import 'package:flutter_demo/provider_demo/computer_page.dart';
import 'package:flutter_demo/redux/page.dart';
import 'package:flutter_demo/sanjiliandong/first_pager.dart';
import 'package:flutter_demo/scroll/scroll_demo.dart';
import 'package:flutter_demo/sliever_demo/sliever_demo.dart';
import 'package:flutter_demo/tabdemo/tabbar_demo.dart';
import 'package:flutter_demo/textfield_demo/text_field.dart';
import 'package:provider/provider.dart';
import 'future_demo2.dart';
import 'spash_page.dart';
import 'tabdemo/tabbar_demo2.dart';
import 'test_demo.dart';
import 'dart:async';
import 'package:flutter_bugly/flutter_bugly.dart';

Future<Null> main() async{
//  FlutterError.onError = (FlutterErrorDetails details) {
//    if (!bool.fromEnvironment("dart.vm.product")) {
//      FlutterError.dumpErrorToConsole(details);
//    } else {
//      Zone.current.handleUncaughtError(
//          details.exception, details.stack);
//    }
//  };
  FlutterBugly.postCatchedException((){

    runApp(MyApp());
  });
  FlutterBugly.init(androidAppId: "79ea0abdc7",iOSAppId: "");
  debugPaintSizeEnabled = true;
//  setCustomErrorPage();

//SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){});
}

void setCustomErrorPage() {
  runZoned(() {
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
//      print(flutterErrorDetails.toString());
      return Center(
        child: Text("Flutter 走神了"),
      );
    };
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
        _) {
      FlutterBugly.postCatchedException((){

      runApp(MyApp());
      });
      FlutterBugly.init(androidAppId: "79ea0abdc7",iOSAppId: "");
    });
  }, onError: (e) {
    print("错误=$e");
//    print("错误=$stack");
  });
  
}

Widget creatApp() {

  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
//    "cust": MyApp(),
      "test": testPage(),
    },
    visitor: (String path, Page<Object, dynamic> page) {
      page.enhancer.append(
        viewMiddleware: <ViewMiddleware<dynamic>>[safetyView<dynamic>()],
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>()
        ],
        effectMiddleware: [],
        middleware: <Middleware<dynamic>>[logMiddleware<dynamic>()],
      );
    },
  );

  return MaterialApp(
    title: 'fish_redux_demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('test', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

class MyApp extends StatelessWidget {
  final ThemeData themeData = ThemeData(
      primarySwatch: Colors.purple,
      primaryColor: Colors.grey[100],
      accentColor: Colors.green[100],
      primaryColorBrightness: Brightness.light);
  // 默认主题
  final ThemeData kDefaultTheme = new ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.orangeAccent[400],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//       theme:defaultTargetPlatform==TargetPlatform.iOS?themeData:kDefaultTheme,
      theme: ThemeData(primaryColor: Colors.white),
//      home: SplashScreen() ,
//      home: FutureDemo2() ,
//      home: ScrollPage3(titls: "测试",),
//      home: AppPage(),
//      home: SlieverDemo(),
//      home: LogoAnim(),
//      home: DropListDemo(),
//      home: Test(),
//      home: IndexPage(),
//      home: HeroOnePage(),
//      home: ComputerPage(),
//      home: ScrollDemo(),
//      home: IndexApp(),
//      home: TextFieldDemo(),
//      home: IsolateDemo(),
//      home: ClockPage(),
//      home: DrawDemo(),
      home: DrawerDemo(),
    );
  }
}
