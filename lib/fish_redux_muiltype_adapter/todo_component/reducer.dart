import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ToDoState> buildReducer() {
  return asReducer(
    <Object, Reducer<ToDoState>>{
      ToDoAction.edit: _edit,
      ToDoAction.done: _done,
    },
  );
}

ToDoState _edit(ToDoState state, Action action) {
  final ToDoState todo=action.payload;
  final ToDoState newState = state.clone();
  if(state.uniqueId == todo.uniqueId){
    return newState..title= todo.title
         ..desc=todo.desc;
  }
  return state;
}


ToDoState _done(ToDoState state, Action action) {
    final String uniqueId=action.payload;
    if(state.uniqueId == uniqueId){
      return state.clone()..isDone=!state.isDone;
    }
    return state;
}

