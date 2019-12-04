import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildView(testState state, Dispatch dispatch, ViewService viewService) {
  ScreenUtil.instance=ScreenUtil(width:375,height: 667,allowFontScaling: true)..init(viewService.context);
  return Scaffold(
    appBar: AppBar(
      title: Text('CounterFishRedux'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            state.count.toString(),
          ),
          RichText(text: TextSpan(
            text: "欢迎关注",
            style: TextStyle(color: Colors.purple),
            children: <TextSpan>[
              TextSpan(
                text: '点我试试',
                recognizer: _ontap()
              )
            ]

          ))
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      //发送的action到了Effect中处理
//      onPressed: () => dispatch(testActionCreator.onAdd()),
      onPressed: () => showcheckBox(viewService,state),
      //也可以发action到reducer中处理
      //onPressed: () => dispatch(CounterActionCreator.add()),
      tooltip: 'add',
      child: Icon(Icons.add),
    ),
  );
}

GestureRecognizer _ontap(){
  TapGestureRecognizer tapGestureRecognizer=TapGestureRecognizer();
  tapGestureRecognizer.onTap=(){
    print('点击');
  };
  return tapGestureRecognizer;
}

void showcheckBox(ViewService viewService, testState state){
  showDialog(context: viewService.context,
   builder: (BuildContext context){
    bool isFlag=false;
    return AlertDialog(
      title: Text("title"),
      content: StatefulBuilder(builder: (context,StateSetter setter){
        return Container(
          child: CheckboxListTile(
            secondary: Icon(Icons.hourglass_empty),
            controlAffinity: ListTileControlAffinity.leading,

            title: Text("选项"),
              value: isFlag,
              onChanged: (value){
              if(value){
                print("${state.count}");
              }
               setter((){
                 isFlag=value;
               });
//               dispatch(testActionCreator.onAdd())

          }),

        );
      }),
    );
   }

  );
}

void showDg(ViewService viewService){
   showDialog(context: viewService.context,
    builder: (BuildContext context){
      return SimpleDialog(
        title: Text("title"),
        contentPadding: EdgeInsets.all(5),

        children: <Widget>[
          SimpleDialogOption(
            onPressed: (){

            },
            child: Text("第二行",style: TextStyle(fontSize: 20),),
          ), SimpleDialogOption(
            onPressed: (){

            },
            child: Text("第二行",style: TextStyle(fontSize: ScreenUtil.instance.setSp(20)),),
          ),

        ],

      );

    },

  );
}

Widget _text(testState state) {
  return Container(
    child: Text("${state.count}"),
  );
}

Widget addIcon(Dispatch dispatch) {
  return Container(
    child: InkWell(
      onTap: (() {
//dispatch(testActionCreator.onAction());
      }),
      child: Icon(
        Icons.add,
        color: Colors.green,
      ),
    ),
  );
}
