import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/area_model.dart';

class AreaSelection extends StatefulWidget {

  final Function onSelect;
  final int initProviceIndex;
  final int initCityIndex;
  final int initCountyIndex;
  final List<AreaModel> provices;

  AreaSelection({Key key, @required this.onSelect, this.initProviceIndex, this.initCityIndex, this.initCountyIndex, this.provices}) : super ( key : key);

  @override
  _AreaSelectionState createState() => _AreaSelectionState();
}

class _AreaSelectionState extends State<AreaSelection> {


  List<AreaModel> citys = [];
  List<AreaModel> county = [];

  ///选中的省份的index
  int selectedProvice = 0;
  ///选中的市的index
  int selectedCity = 0;
  ///选中的区的index
  int selectedCounty = 0;


  ///定义省份控制器
  FixedExtentScrollController proviceCotroller;
  ///定义市控制器
  FixedExtentScrollController cityController;
  ///定义区控制器
  FixedExtentScrollController countyController;

  /// 选择变化时候的值
  Map tempAreaInfo;

  @override
  void initState() {
    super.initState();
    selectedProvice = widget.initProviceIndex ?? 0;
    selectedCity = widget.initCityIndex ?? 0;
    selectedCounty = widget.initCountyIndex ?? 0;
    citys = widget.provices[selectedProvice].childs;
    county = citys[selectedCity].childs;
    proviceCotroller = new FixedExtentScrollController(initialItem: widget.initProviceIndex ?? 0);
    cityController = new FixedExtentScrollController(initialItem: widget.initCityIndex ?? 0);
    countyController = new FixedExtentScrollController(initialItem: widget.initCountyIndex ?? 0);
    tempAreaInfo = {
      'proviceId': widget.provices[selectedProvice].id,
      'cityId': citys[selectedCity].id,
      'countyId': county[selectedCounty].id,
      'address': widget.provices[selectedProvice].name + citys[selectedCity].name + county[selectedCounty].name,
      'proviceIndex': selectedProvice,
      'cityIndex': selectedCity,
      'countyIndex': selectedCounty
    };
  }

  ///给父组件传递结果
  void passParams(){
    setState(() {
      tempAreaInfo = {
        'proviceId': widget.provices[selectedProvice].id,
        'cityId': citys[selectedCity].id,
        'countyId': county[selectedCounty].id,
        'address': widget.provices[selectedProvice].name + citys[selectedCity].name + county[selectedCounty].name,
        'proviceIndex': selectedProvice,
        'cityIndex': selectedCity,
        'countyIndex': selectedCounty
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('取消'),
                ),
                GestureDetector(
                  onTap: (){
                    widget.onSelect(tempAreaInfo);
                    Navigator.of(context).pop();
                  },
                  child: Text('确认', style: TextStyle(color: Colors.red),),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    diameterRatio: 1.1,
                    scrollController: proviceCotroller,
                    itemExtent: 48.0,
                    onSelectedItemChanged: (position){
                      setState(() {
                        selectedProvice = position;
                        citys = widget.provices[selectedProvice].childs;
                        selectedCity = 0;
                        county = citys[selectedCity].childs;
                      });
                      cityController.jumpToItem(0);
                      countyController.jumpToItem(0);
                      passParams();
                    },
                    children: createEachItem(widget.provices),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    scrollController: cityController,
                    itemExtent: 48.0,
                    onSelectedItemChanged: (position){
                      setState(() {
                        selectedCity = position;
                        selectedCounty = 0;
                        county = citys[selectedCity].childs;
                      });
                      countyController.jumpToItem(0);
                      passParams();
                    },
                    children: createEachItem(citys),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    scrollController: countyController,
                    itemExtent: 48.0,
                    onSelectedItemChanged: (position){
                      selectedCounty = position;
                      passParams();
                    },
                    children: createEachItem(county),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> createEachItem(List<AreaModel> data) {
  List<Widget> target = [];

  for (AreaModel item in data) {
    target.add(Container(
      padding: EdgeInsets.only(top: 14.0, bottom: 10.0),
      child: Text(
        item.name ?? '',
        style: TextStyle(fontSize: 14.0),
      ),
    ));
  }

  return target;
}