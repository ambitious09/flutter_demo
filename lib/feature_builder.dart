import 'package:flutter/material.dart';


class FutureBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:    FutureBuilder<String>(
          future: getWorkData(),
          builder: (BuildContext context,AsyncSnapshot snap){
        if(snap.connectionState==ConnectionState.done){
          if(snap.hasError){
            return Text("error");
          }else{
            return Text("right");
          }
        }else{
          return CircularProgressIndicator();
        }
      }),
    );

  }

  Future<String> getWorkData() async{
    return Future.delayed(Duration(seconds: 2),()=>"网络数据");
  }
}
