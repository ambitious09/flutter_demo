import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_demo/fish_redux_muiltype_adapter/global_store/action.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/global_store/store.dart';
import 'action.dart';
import 'state.dart';
import '../todo_component/component.dart';

Effect<ToDoEditState> buildEffect() {
  return combineEffects(<Object, Effect<ToDoEditState>>{
    ToDoEditAction.onDone: _onDone,
    ToDoEditAction.onChangeTheme: _onChangeTheme,
  });
}

void _onDone(Action action, Context<ToDoEditState> ctx) {
  Navigator.of(ctx.context).pop<ToDoState>(
    ctx.state.toDo.clone()
        ..desc= ctx.state.descEditController.text
        ..title = ctx.state.nameEditController.text
  );
}


void _onChangeTheme(Action action, Context<ToDoEditState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onAction());
}
