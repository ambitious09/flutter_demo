import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/scroll/scroll_provider.dart';

class ScrollDemo extends StatefulWidget {
  @override
  _ScrollDemoState createState() => _ScrollDemoState();
}

class _ScrollDemoState extends State<ScrollDemo> {
  ScrollController _scrollController=ScrollController();
  ScrollProvider _provider=ScrollProvider();
   bool isShowTop=false;
  @override
  void initState() {
    super.initState();
  _scrollController.addListener((){
    print("滑动高度=${_scrollController.offset}");
      if(_scrollController.offset<1000&&isShowTop){
        setState(() {
          isShowTop=false;
        });
//         _provider.setValue(false);
      }else if(_scrollController.offset>=1000&&!isShowTop){
//        _provider.setValue(true);
      setState(() {
        isShowTop=true;
      });

      }
  });

  }
  
  void scrollTop(){
    _scrollController.animateTo(0, duration: Duration(milliseconds: 2), curve:Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滑动"),
      ),
      body:  Scrollbar(
            child: ListView.builder(
              itemCount: 100,
                itemExtent: 50,
                controller: _scrollController,
                itemBuilder: (context,index){
                return ListTile(
                  title: Text("$index"),
                );
                }
            ),
        ),
      floatingActionButton: !isShowTop?null:FloatingActionButton(
        child: Icon(Icons.arrow_upward),
          onPressed: scrollTop
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}
