import 'package:flutter/material.dart';
import 'package:flutter_demo/sanjiliandong/area_picker.dart';
import 'package:flutter_demo/sanjiliandong/model/area_model.dart';
import 'package:flutter_demo/sanjiliandong/data.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  Map selectArea;
  List<AreaModel> areas;

  ///接收选择的结果
  void handleSelect (Map targetArea) {
    setState(() {
      selectArea = targetArea;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    areas=Data.provices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('省市区三级联动'),
        centerTitle: true,
      ),
      body:Container(
        padding: EdgeInsets.only(top: 50.0),
        child:  Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Text(selectArea != null ? selectArea['address'] : '未选择...'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
                    showModalBottomSheet(context: context, builder: (_)=>Container(
                      height: 300.0,
                      child: AreaSelection(
                        onSelect: handleSelect,
                        initProviceIndex: selectArea == null ? 0 : selectArea['proviceIndex'],
                        initCityIndex: selectArea == null ? 0 : selectArea['cityIndex'],
                        initCountyIndex: selectArea == null ? 0 : selectArea['countyIndex'],
                        provices: areas,
                      ),
                    ));
                  },
                  child: Text('点击选择省市区'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}