import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';
import 'test/state.dart';
import 'todo_component/component.dart';

Reducer<PageState> buildReducer() {
  return asReducer(
    <Object, Reducer<PageState>>{
      PageAction.initTools: _initToolsReducer,
      PageAction.initTest: _initTests,
    },
  );
}

PageState _initToolsReducer(PageState state, Action action) {
  final List<ToDoState> toDos=action.payload?? <ToDoState>[];
  final PageState newState = state.clone();
  newState.toDos=toDos;
  return newState;
}

PageState _initTests(PageState state, Action action) {
  final List<TestState> toDos=action.payload?? <TestState>[];
  final PageState newState = state.clone();
  newState.tests=toDos;
  return newState;
}
