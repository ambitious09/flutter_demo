import 'package:flutter/material.dart';

class CardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text("card"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: 200,
        height: 100,
        child: Card(
            color: Colors.blueAccent,
            elevation: 10,
            clipBehavior: Clip.antiAlias,
            semanticContainer: false,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )
            ),
            child: Center(

              child:
//                AspectRatio(
//                  aspectRatio: 1 / 1,
//                  child: Container(
//                    color: Colors.purple,
//                  ),
//                ),
                Row(

                  children: <Widget>[
                    CircleAvatar(
                      child: Image.network(
                        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559384010222&di=f4a0b36f7466387d6a0b909186ad0c86&imgtype=0&src=http%3A%2F%2Fimage.biaobaiju.com%2Fuploads%2F20180707%2F05%2F1530911272-gKxRVwjmpN.jpg",
                      )
                    ),
                    Text("ddddd"),
          ],

                ),

            ),
        )
      ),
    );
  }
}
