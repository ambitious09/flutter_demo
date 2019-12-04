import 'package:flutter/material.dart';
import 'package:flutter_demo/Isolatesdemo/photo_listview.dart';
import 'package:http/http.dart' as http;
import '../Isolatesdemo/photo.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';

const IMAGE_SRC =
    'http://imglf3.nosdn.127.net/img/Mm9KQTVTN2NLSmxOdXp0Q3pRMTYycm1IakVPcERLOTNPVjRTcEJrZ2M5ZUpuMk1WMXJGNEhBPT0.jpg';



class IsolateDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("isolate"),
      ),
      body: FutureBuilder<List<Photo>>(
          future:_fetchPhotos(http.Client()),
        builder: (context,snapshot){
            if(snapshot.hasError){
              print("error");
            }
            if(snapshot.hasData){
              return PhotoListView(list: snapshot.data);
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
        },
      ),
    );
  }

//  List<Photo> generatorPhoto(String body) {
//    List list = json.decode(body);
//    return list.map<Photo>((item) => Photo.fromJson(item)).toList();
//  }
//
//  Future<List<Photo>> _fetchPhotos(http.Client client) async {
//    http.Response response = await client.get(
//        'https://3g.163.com/photocenter/api/list/0001/00AP0001,3R710001,4T8E0001/30/100.json');
//    return compute(generatorPhoto, response.body);
//  }
}
List<Photo> generatorPhoto(String body) {
  List list = json.decode(body);
  return list.map<Photo>((item) => Photo.fromJson(item)).toList();
}

Future<List<Photo>> _fetchPhotos(http.Client client) async {
  http.Response response = await client.get(
      'https://3g.163.com/photocenter/api/list/0001/00AP0001,3R710001,4T8E0001/30/100.json');
  return compute(generatorPhoto, response.body);
}