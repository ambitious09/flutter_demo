import 'package:flutter/material.dart';

class ComputerProvider extends ChangeNotifier{

  int _count=0;
  int get count =>_count;

  void setCount(){
    ++_count;
    notifyListeners();

  }
}