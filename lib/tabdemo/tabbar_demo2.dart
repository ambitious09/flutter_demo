import 'package:flutter/material.dart';
import 'ItemView.dart';
import 'select_view_pager.dart';

class TabBarDemo2 extends StatefulWidget {
  @override
  _TabBarDemo2State createState() => _TabBarDemo2State();
}

class _TabBarDemo2State extends State<TabBarDemo2>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var tabs = <Tab>[];
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    tabs = <Tab>[
      Tab(
        text: "Tab1",
      ),
      Tab(
        text: "Tab2",
      ),
      Tab(
        text: "Tab3qqqq",
      ),
      Tab(
        text: "Tab4qq",
      ),
      Tab(
        text: "Tab",
      ),
      Tab(
        text: "Tab6",
      ),
      Tab(
        text: "Tab7",
      ),

    ];
    widgets = <Widget>[
      SelectViewPager(
          item: ItemView(title: "ceshi", iconData: Icons.directions_bike)),
      Text("1"),
      Text("1"),
      Text("1"),
      Text("1"),
      Text("1"),
      Text("1"),
    ];
    //initialIndex初始选中第几个
    _tabController =
        TabController(initialIndex: 1, length: widgets.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: tabs,
            indicatorColor: Colors.indigoAccent,
            indicatorSize: TabBarIndicatorSize.tab,
//          indicatorWeight: 1,
            indicatorPadding: EdgeInsets.only(bottom: 8.0),
            labelColor: Colors.indigoAccent,
//          labelPadding: EdgeInsets.only(left: 20.0),
            labelStyle: TextStyle(fontSize: 15.0),
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: TextStyle(fontSize: 20.0),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: widgets,
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
