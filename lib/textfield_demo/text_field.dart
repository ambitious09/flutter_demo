import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  var foues=FocusNode();
  var foues1=FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foues.addListener((){
      if(!foues.hasFocus){

      print("完成");
      }
    });
    foues1.addListener((){
      if(!foues1.hasFocus){

      print("完成b");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("textfield"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              focusNode: foues,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  icon: new Icon(Icons.phone),
                  labelText: "请输入手机号",
                  helperText: "注册时填写的手机号"),
//              onChanged: (String str) {
//                //onChanged是每次输入框内每次文字变更触发的回调
//                print('手机号为：$str----------');
//              },
              onEditingComplete: (){
                print("完成b");
              },
              onSubmitted: (String str) {
                //onSubmitted是用户提交而触发的回调{当用户点击提交按钮（输入法回车键）}
                print('最终手机号为:$str---------------');
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              focusNode: foues1,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  icon: new Icon(Icons.phone),
                  labelText: "请输入手机号",
                  border: OutlineInputBorder(),
                  helperText: "注册时填写的手机号"),
              onChanged: (String str) {
                //onChanged是每次输入框内每次文字变更触发的回调
                print('手机号为：$str----------');
              },
              onSubmitted: (String str) {
                //onSubmitted是用户提交而触发的回调{当用户点击提交按钮（输入法回车键）}
                print('最终手机号为:$str---------------');
              },
            ),
//            showSearch(context: null, delegate: null)
          ],
        ),
      ),
    );;
  }
}

