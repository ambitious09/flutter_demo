import 'package:flutter/material.dart';
import 'package:flutter_demo/Isolatesdemo/photo.dart';

class PhotoListView extends StatelessWidget {
  final List<Photo> list;

  const PhotoListView({Key key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context,i){
          return Image.network(list[i].thumbnailUrl);
        },
      itemCount: list.length,
    );
  }
}

