import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/inheritedwidget/Item.dart';

class MyInHerid extends InheritedWidget {
  MyInHerid({Key key, @required Widget widget, @required this.data}):super(key: key,child:widget);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  final _MyInHeridwidgetState data;
}

class MyInHeridwidget extends StatefulWidget {
  MyInHeridwidget({Key key, this.child});

  final Widget child;

  @override
  _MyInHeridwidgetState createState() => _MyInHeridwidgetState();

  static _MyInHeridwidgetState of([BuildContext context, bool rebuild = true]) {
    return (rebuild
            ? context.inheritFromWidgetOfExactType(MyInHerid) as MyInHerid  //方法获得最近的指定类型的Inherited widget
            : context.ancestorWidgetOfExactType(MyInHerid) as MyInHerid)
        .data;
  }
}

class _MyInHeridwidgetState extends State<MyInHeridwidget> {
  List<Item> _items = <Item>[];

  int get itemcount => _items.length;

  void additem(String reference) {
    setState(() {
      _items.add(Item(reference));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInHerid(widget: widget.child, data: this);
  }
}

class MyTree extends StatefulWidget {
  @override
  _MyTreeState createState() => _MyTreeState();
}

class _MyTreeState extends State<MyTree> {
  @override
  Widget build(BuildContext context) {
    return MyInHeridwidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
        ),
        body: Column(
          children: <Widget>[
            WidgetA(),
            Container(
              child: Column(
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  WidgetB(),
                  WidgetC(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _MyInHeridwidgetState state = MyInHeridwidget.of(context, true);
    return Container(
      child: RaisedButton(
          child: Text("add item"),
          onPressed: () {
            state.additem("new item");
          }),
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _MyInHeridwidgetState state = MyInHeridwidget.of(context);
    return Text("${state.itemcount}");
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("iam widget c"),
    );
  }
}
