import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/glide_demo.dart';
import 'package:flutter_demo/i18n/my_i18n.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class SlieverDemo extends StatelessWidget {
  final media = MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  @override
  Widget build(BuildContext context) {
    print("底部距离=${media.viewPadding.bottom}");
    return Scaffold(
        appBar: AppBar(
          title: Text(FlutterI18n.translate(context, "title")),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: CustomScrollView(
                slivers: <Widget>[_buildBanner(), _buildStickBar(), _buildList()],
            )),
            Container(
                padding: EdgeInsets.only(bottom: media.viewPadding.bottom),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => ScrollPage3(
//                                  titls: "test",
//                                )));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MyI18n(language: "it")));
                  },
                  child: Text(FlutterI18n.translate(context, "title")),
                  color: Colors.green,
                ))
          ],
//        overflow: Overflow.clip,
//        alignment: Alignment.bottomCenter,
//          fit: StackFit.passthrough,
        ));
  }

  Widget _buildList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return index == 49
            ? Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Container(
                  height: 50,
                  color: index % 2 == 0 ? Colors.white : Colors.black12,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(FlutterI18n.translate(context, "content",
                      Map.fromIterables(["index"], ["$index"]))),
                ),
              )
            : Container(
                height: 50,
                color: index % 2 == 0 ? Colors.white : Colors.black12,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(FlutterI18n.translate(context, "content",
                    Map.fromIterables(["index"], ["$index"]))),
              );
      }, childCount: 50),
    );
  }

  Widget _buildBanner() {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 200,
        child: Image.network(
          "http://image2.sina.com.cn/ent/s/j/p/2007-01-12/U1345P28T3D1407314F329DT20070112145144.jpg",
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildStickBar() {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _SliverPersistentHeaderDelegate(
        minHeight: 30,
        maxHeight: 30,
        child: Container(
          padding: EdgeInsets.only(left: 16),
          color: Colors.pink,
          alignment: Alignment.centerLeft,
          child: Text("浮动", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverPersistentHeaderDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.fromSize(
      child: child,
    );
  }

  @override
  double get maxExtent => max(minHeight, maxHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
    ;
  }
}
