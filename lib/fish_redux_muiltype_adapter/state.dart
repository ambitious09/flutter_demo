import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/global_store/state.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/todo_component/state.dart';
import 'report_component/component.dart';
import 'test/state.dart';

class PageState extends MutableSource implements GlobalBaseState, Cloneable<PageState> {
     List<ToDoState> toDos;
     List<TestState> tests;
  @override
  PageState clone() {
    return PageState()
    ..toDos=toDos
      ..tests=tests
    ..themeColor=themeColor;
  }

  @override
  Color themeColor;

  @override
  Object getItemData(int index) {
    return themeColor==Color(0xff000000)?tests[index]:toDos[index];
  }

  @override
  String getItemType(int index) {
     if(themeColor==Color(0xff000000)){
       return "test";
     }else{
       return "toDo";
     }
  }

  @override
  int get itemCount => themeColor==Color(0xff000000)?tests.length: toDos.length;

  @override
  void setItemData(int index, Object data) => themeColor==Color(0xff000000)?tests[index]=data:toDos[index]=data;
}

PageState initState(Map<String, dynamic> args) {
  return PageState();
}

class TitleConner extends ConnOp<PageState,TitleState> with ReselectMixin<PageState,TitleState>{
  @override
  TitleState computed(PageState state) {

    return TitleState()
    ..done=state.toDos.where((ToDoState state) =>state.isDone).length
    ..total=state.toDos.length;
  }

  @override
  List<dynamic> factors(PageState state) {

    return [
      state.toDos.where((ToDoState state) =>state.isDone).length,
      state.toDos.length
    ];
  }
  @override
  void set(PageState state, TitleState subState) {
    throw Exception('Unexcepted to set PageState from ReportState');
  }

}
