import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/global_store/state.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/todo_component/component.dart';

class ToDoEditState implements GlobalBaseState, Cloneable<ToDoEditState> {

    ToDoState toDo;
    TextEditingController nameEditController;
    TextEditingController descEditController;

    FocusNode focusNodeName;
    FocusNode focusNodeDesc;


  @override
  ToDoEditState clone() {
    return ToDoEditState()
      ..nameEditController = nameEditController
      ..descEditController = descEditController
      ..focusNodeName = focusNodeName
      ..focusNodeDesc = focusNodeDesc
      ..toDo = toDo
      ..themeColor = themeColor;
  }

  @override
  Color themeColor;
}

ToDoEditState initState(ToDoState arg) {
  final ToDoEditState state = ToDoEditState();
  state.toDo = arg?.clone() ?? ToDoState();
  state.nameEditController = TextEditingController(text: arg?.title);
  state.descEditController = TextEditingController(text: arg?.desc);
  state.focusNodeName = FocusNode();
  state.focusNodeDesc = FocusNode();
  return state;
}
