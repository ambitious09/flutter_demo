import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:core';

class ScrollPage3 extends StatefulWidget {

  String titls;
  ScrollPage3({this.titls});

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage3>  with AutomaticKeepAliveClientMixin<ScrollPage3>{


  List<int> gridData = List<int>();

  Runes runes;

  _setGridData() {
    for (int i = 0; i < 15; i++) {
      gridData.add(i);
    }
  }

  @override
  void initState() {
    _setGridData();
    print("是否=${bool.fromEnvironment("dart.vm.product")}");
     runes = new Runes('\u{1f604} \u{1f604} \u6261');
    String runesStr = '🌟👀🐶👨';
    Encoding.getByName("utf-8");
    print("表情=${runesStr.runes.length}");
    print("数值=${30000 / 3.6 * 30000}");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(appBar: AppBar(title: Text(widget.titls)), body: _bodyWid());
  }

  Widget _bodyWid() {
    return CustomScrollView(slivers: <Widget>[
      SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
        return _typeTitleWid('热门分类');
      }, childCount: 1)
      ),
      SliverPadding(padding: const EdgeInsets.all(8.0), sliver: _typeGridWid()),
      SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
        return _typeTitleWid('智能推荐');
      }, childCount: 1)),
      _typeListWid()
    ]);
  }



  Widget _typeTitleWid(var titleStr) {
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(String.fromCharCodes(runes) ,
                      style:
                          TextStyle(color: Color(0xFF808080), fontSize: 14.0))),
              Divider(color: Color(0xFF808080), height: 0.5)
            ]));
  }

  Widget _typeGridWid() {
    return SliverGrid(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 4.0),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
              height: 64.0,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(3.0)),
              child: Center(
                  child: Text('分类 ${(index + 1)}',
                      style: TextStyle(
                          color: Color(0xFF333333), fontSize: 14.0))));
        }, childCount: gridData.length));
  }

  Widget _typeListWid() {
    return SliverFixedExtentList(
        itemExtent: 50.0,
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('推荐精彩内容 ${(index + 1)}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0xFF333333), fontSize: 15.0))),
                Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Divider(color: Color(0xFF808080), height: 0.5))
              ]));
        }, childCount: gridData.length));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
