import 'package:flutter/material.dart';
import 'package:flutter_demo/tabdemo/ItemView.dart';

class SelectViewPager extends StatelessWidget {
  final ItemView item;
  const SelectViewPager({this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: <Widget>[
            Text(item.title),
            Icon(item.iconData,size: 128.0,)
          ],
        ),
      ),
    );
  }
}
