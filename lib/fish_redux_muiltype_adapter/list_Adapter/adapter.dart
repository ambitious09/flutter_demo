import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/state.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/test/component.dart';

import 'reducer.dart';
import '../todo_component/component.dart';

class ToDoListAdapter extends SourceFlowAdapter<PageState> {
  ToDoListAdapter()
      : super(
    pool: <String, Component<Object>>{
      "toDo": ToDoComponent(),
      "test": TestComponent()
    },
    reducer: buildReducer()


        );
}
