import 'package:flutter/material.dart';
/// import 'package:flutter/rendering.dart';
/// import 'package:flutter_go/views/first_page/first_page.dart';



class AppPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<AppPage>
     {
  bool isSearch = false;

  List<Widget> _list = List();
  int _currentIndex = 0;
  List tabData = [
    {'text': 'WIDGET', 'icon': Icon(Icons.extension)},
    {'text': '关于手册', 'icon': Icon(Icons.import_contacts)},
    {'text': '个人中心', 'icon': Icon(Icons.account_circle)},

    //https://flutter-go.pub/api/isInfoOpen
  ];
  List<BottomNavigationBarItem> _myTabs = [];
  String appBarTitle;

  @override
  void initState() {
    super.initState();
    tabData.insert(0, {'text': '业界动态', 'icon': Icon(Icons.language)});
    appBarTitle = tabData[0]['text'];

    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }
    _list
      ..add(Text("1"))
      ..add(Text("2"))
      ..add(Text("3"))
      ..add(Text("3"));
  }

  @override
  void dispose() {
    super.dispose();
  }








  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("title"),

      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _itemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,

        fixedColor: Theme.of(context).accentColor,
      ),
    );
  }

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
  }
}