import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
//          SplashScreen() ,
////       FutureDemo2() ,
////      ScrollPage3(titls: "测试",),
////       AppPage(),
////      SlieverDemo(),
////       LogoAnim(),
////      home: DropListDemo(),
////      home: Test(),
////      home: IndexPage(),
////      home: HeroOnePage(),
////      home: ComputerPage(),
////      home: ScrollDemo(),
////      home: IndexApp(),
////      home: TextFieldDemo(),
////      home: IsolateDemo(),
////      home: ClockPage(),
////      home: DrawDemo(),
//          home: DrawerDemo(),
         Container(
           color: Colors.blue,
         ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
        ].map<Widget>((Widget widget){
              return Expanded(
                flex: 1,
                child: widget,
              );
        }).toList(),
      ),
    );
  }
}
