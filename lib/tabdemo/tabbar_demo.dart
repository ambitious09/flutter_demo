import 'package:flutter/material.dart';
import 'package:flutter_demo/tabdemo/ItemView.dart';
import 'package:flutter_demo/tabdemo/select_view_pager.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("tabdemo"),
            bottom: TabBar(
              isScrollable: true,
                tabs: tabs.map((ItemView item){
                  return Tab(
                   text: item.title,
                    icon: Icon(item.iconData),
                  );
                }).toList()
            ),

          ),
          body: TabBarView(children: tabs.map((ItemView item){
              return SelectViewPager(item:item);
          }).toList()
          ),
        )
    );
  }

  List<ItemView> tabs=const <ItemView>[
    const ItemView(title: "as",iconData: Icons.directions_bike),
    const ItemView(title: "as",iconData: Icons.directions_bike),
    const ItemView(title: "as",iconData: Icons.directions_bike),
    const ItemView(title: "as",iconData: Icons.directions_bike),
    const ItemView(title: "as",iconData: Icons.directions_bike),
    const ItemView(title: "as",iconData: Icons.directions_bike),


  ];

}


