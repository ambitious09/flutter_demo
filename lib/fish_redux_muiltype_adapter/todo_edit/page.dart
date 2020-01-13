import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/todo_component/component.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class ToDoEditPage extends Page<ToDoEditState, ToDoState> {
  ToDoEditPage()
      : super(
            initState: initState,
            effect: buildEffect(),
//            reducer: buildReducer(),
            view: buildView,
//            dependencies: Dependencies<ToDoEditState>(
//                adapter: null,
//                slots: <String, Dependent<ToDoEditState>>{
//                }),
//            middleware: <Middleware<ToDoEditState>>[
//            ],
  );

}
