import 'package:flutter/material.dart';
import 'package:flutter_demo/provider_demo/computer_provide.dart';
import 'package:provider/provider.dart';

class ComputerPage extends StatefulWidget {
  @override
  _ComputerPageState createState() => _ComputerPageState();
}

class _ComputerPageState extends State<ComputerPage>  with WidgetsBindingObserver{
  ComputerProvider _computerProvider= ComputerProvider();
  void changeCount(){
    _computerProvider.setCount();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    print("当前状态=$state");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("provider"),
        ),
       body: ChangeNotifierProvider(

           builder: (_)=>_computerProvider,
         child: Row(
           children: <Widget>[
             Consumer<ComputerProvider>(builder: (_,provider,child){
               return Text("${provider.count}");
             }),
              Expanded(child:RaisedButton(onPressed: (){
                changeCount();
              },
                child: Text("加法"),
              ),
                flex: 1,
              ),
             RichText(text: TextSpan(
               text: "合计：",
               style: TextStyle(color: Colors.pink,fontSize: 14),
               children: <TextSpan>[
                 TextSpan(
                   text: "¥ 192",
                   style: TextStyle(color: Colors.pink,fontSize: 16)

                 )
               ]

             ))
           ],
         ),

       )
    );
  }
}
