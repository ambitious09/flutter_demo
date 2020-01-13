import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/list_Adapter/adapter.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/state.dart' ;

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'report_component/component.dart';

class TodoListsPage extends Page<PageState, Map<String, dynamic>> {
  TodoListsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PageState>(
                adapter: NoneConn<PageState>()+ToDoListAdapter(),
                slots: <String, Dependent<PageState>>{  //首页的附加数据
                  "report": TitleConner() + TitleComponent()
                }
                ),
//            middleware: <Middleware<PageState>>[
//
//            ],
  );

}
