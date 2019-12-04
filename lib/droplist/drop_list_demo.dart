import 'package:drop_down_list/list_item.dart';
import 'package:drop_down_list/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';


class DropListDemo extends StatefulWidget {
  @override
  _DropListDemoState createState() => _DropListDemoState();
}

class _DropListDemoState extends State<DropListDemo> {
   List<ListItem> items;

  @override
  void initState() {
    super.initState();
    items=getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropDownList(
        title: "dd",
        items: items,
        image: "images/ic_a.png",
        iconImage: "images/arrow_bottom.png",
        titleColor: Color(0xff333333),
        answerColor: Color(0xff999999),
        iconTextColor: Colors.white,
        lineColor: Colors.grey,
        backImage: "images/arrow_bottom.png",
        bar: MyAppBar(title: "测试下拉列表",titleColor: Colors.black,),


      ),
    );
  }


  List<ListItem> getItems() {
       List<ListItem> lists=[];
       for (var i = 0; i < 30; ++i) {
         lists.add(ListItem("问答$i", "答案$i", false,"测试$i"));

       }
       return lists;

  }


}
