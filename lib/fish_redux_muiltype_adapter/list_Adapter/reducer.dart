import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/state.dart';

import 'action.dart';
import '../todo_component/component.dart';
import '../todo_component/action.dart' as todo_action;

Reducer<PageState> buildReducer() {
  return asReducer(
    <Object, Reducer<PageState>>{
      ToDoListAction.add: _add,
      todo_action.ToDoAction.remove: _remove

    },
  );
}

PageState _add(PageState state, Action action) {
  final ToDoState todo = action.payload;
  return state.clone()..toDos=(state.toDos.toList()..add(todo));
}
PageState _remove(PageState state, Action action) {
  final String unique = action.payload;
  return state.clone()
    ..toDos = (state.toDos.toList()
      ..removeWhere((ToDoState state) => state.uniqueId == unique));
}