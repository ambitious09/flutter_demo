import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/glide_demo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider_demo/computer_page.dart';

import 'CurrentIndexProvide.dart';
import 'LoadAssetImage.dart';

class IndexApp extends StatefulWidget {
  @override
  _IndexAppState createState() => _IndexAppState();
}

class _IndexAppState extends State<IndexApp> {
  final _pageController = PageController();
  CurrentIndexProvide provider = CurrentIndexProvide();
  List<BottomNavigationBarItem> _list;
  var _appBarTitles = ['订单', '商品', '统计', '店铺'];

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem(){
    if (_list == null){
      var _tabImages = [
        [
          const LoadAssetImage("images/icon_order.png", width: 25.0, color:  Color(0xffbfbfbf),),
          const LoadAssetImage("images/icon_order.png", width: 25.0, color: Color(0xFF4688FA),),
        ],
        [
          const LoadAssetImage("images/icon_commodity.png", width: 25.0, color:  Color(0xffbfbfbf),),
          const LoadAssetImage("images/icon_commodity.png", width: 25.0, color: Color(0xFF4688FA),),
        ],
        [
          const LoadAssetImage("images/icon_statistics.png", width: 25.0, color:  Color(0xffbfbfbf),),
          const LoadAssetImage("images/icon_statistics.png", width: 25.0, color: Color(0xFF4688FA),),
        ],
        [
          const LoadAssetImage("images/icon_shop.png", width: 25.0, color:  Color(0xffbfbfbf),),
          const LoadAssetImage("images/icon_shop.png", width: 25.0, color: Color(0xFF4688FA),),
        ]
      ];
      _list = List.generate(4, (i){
        return BottomNavigationBarItem(
            icon: _tabImages[i][0],
            activeIcon: _tabImages[i][1],
            title: Padding(
              padding: const EdgeInsets.only(top: 1.5),
              child: Text(_appBarTitles[i], key: Key(_appBarTitles[i]),),
            )
        );
      });
    }
    return _list;
  }

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心'),
    ),
  ];

  final List<Widget> tabBodies = [
    ScrollPage3(titls: "1",),
    ScrollPage3(titls: "2",),
    ScrollPage3(titls: "4",),
    ComputerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_)=>provider,
      child: Scaffold(
          bottomNavigationBar: Consumer<CurrentIndexProvide>(builder: (_,provide,__){
            return BottomNavigationBar(
//              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: provide.value,
//              selectedFontSize: 20,
//              unselectedFontSize: 12,
//              elevation: 5.0,
//              iconSize: 21.0,
            elevation: 0,
              selectedItemColor: Color(0xFF4688FA),
              unselectedItemColor:  Color(0xffbfbfbf),
              items: _buildBottomNavigationBarItem(),
              onTap: (index){ //切换导航卡
                _pageController.jumpToPage(index);
              },
            );
          }) ,
          body: PageView(
            controller: _pageController,
            children: tabBodies,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: _onPageChanged,

          )
      ),
    );

  }
  void _onPageChanged(int index) {
    provider.value = index;
  }
}

