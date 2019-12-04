import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ScrollProvider extends ChangeNotifier{

  bool _isShowTop=false;

  bool get isShowtop =>_isShowTop;

  void setValue(bool flag){
    _isShowTop=flag;
    notifyListeners();
  }

}