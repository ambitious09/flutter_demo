import 'package:event_bus/event_bus.dart';
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
import 'package:flutter_demo/eventbus/event_bus_demo.dart';
import 'package:flutter_demo/glide_demo.dart';
import 'package:flutter_demo/hero_demo/hero_one.dart';
import 'package:flutter_demo/my_custom_view.dart';
import 'package:flutter_demo/navation_demo.dart';
import 'package:flutter_demo/provider/CurrentIndexProvide.dart';
import 'package:flutter_demo/provider/index_app.dart';
import 'package:flutter_demo/provider_demo/computer_page.dart';
import 'package:flutter_demo/redux/page.dart';
import 'package:flutter_demo/routes.dart';
import 'package:flutter_demo/sanjiliandong/first_pager.dart';
import 'package:flutter_demo/scroll/scroll_demo.dart';
import 'package:flutter_demo/sliever_demo/sliever_demo.dart';
import 'package:flutter_demo/tabdemo/tabbar_demo.dart';
import 'package:flutter_demo/textfield_demo/text_field.dart';
import 'package:flutter_demo/widget/no_scale_text_widget.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'future_demo2.dart';
import 'i18n/my_i18n.dart';
import 'inheritedwidget/myinheritedwidget.dart';
import 'spash_page.dart';
import 'tabdemo/tabbar_demo2.dart';
import 'test_demo.dart';
import 'dart:async';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/global_store/state.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/global_store/store.dart';
import 'package:flutter_demo/common/events.dart';
import 'package:flutter_demo/common/AppColors.dart';

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
//  runApp(CustomApp());

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

      runApp(creatApp());
      });
      FlutterBugly.init(androidAppId: "79ea0abdc7",iOSAppId: "");
    });
  }, onError: (e) {
    print("错误=$e");
//    print("错误=$stack");
  });
  
}

class CustomApp extends StatefulWidget {
  @override
  _CustomAppState createState() => _CustomAppState();
}

class _CustomAppState extends State<CustomApp> {

  Color _primyColor;
  StreamSubscription _sub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sub=eventBus.on<ThemeColor>().listen((event){
        setState(() {
          _primyColor=AppColors.getColor(event.color);
        });
    });
    Map<String,dynamic> map={"as":12};
    println("map===${map["as"]}");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "eventdemo",
      theme: ThemeData(
        primaryColor: _primyColor
      ),
      home: EventBusDemo(),

    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _sub.cancel();
  }
}




Widget creatApp() {

  return MaterialApp(
    title: 'fish_redux_demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('todo', null),
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
//      home: DrawerDemo(),

//      home: MyTree(),
//      home: MyI18n(),
      home: routes.buildPage('todo_list', null),
      localizationsDelegates: [
        FlutterI18nDelegate(
            useCountryCode: false, fallbackFile: 'en', path: 'images/i18n'),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(
            builder: (BuildContext context) {
          return routes.buildPage(settings.name, settings.arguments);
        },
            settings: RouteSettings(name: settings.name));


      },

      builder: (context,child){
        return NoScaleTextWidget(child: child);  // 全局控制应用的字体大小
      },

    );
  }
}
