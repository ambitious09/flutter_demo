

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/global_store/state.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/global_store/store.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/page.dart';
import 'package:flutter_demo/fish_redux_muiltype_adapter/todo_edit/page.dart';
import 'package:flutter_demo/redux/page.dart';

final AbstractRoutes routes = PageRoutes(
  pages: <String, Page<Object, dynamic>>{
//    "cust": MyApp(),
//    "test": testPage(),
    "todo_list": TodoListsPage(),
    "todo_edit": ToDoEditPage(),
  },


  visitor: (String path, Page<Object, dynamic> page) {

    if(page.isTypeof<GlobalBaseState>()){

      page.connectExtraStore<GlobalState>(GlobalStore.store, (Object pageState,GlobalState appstate){
        final GlobalBaseState p=pageState;
        if(p.themeColor !=appstate.themeColor){
          if(pageState is Cloneable){
            final Object copy=pageState.clone();
            final GlobalBaseState newstate=copy;
            newstate.themeColor = appstate.themeColor;

            return  newstate;
          }
        }
        return pageState;

      });

    }


    page.enhancer.append(
      viewMiddleware: <ViewMiddleware<dynamic>>[safetyView<dynamic>()],
      adapterMiddleware: <AdapterMiddleware<dynamic>>[
        safetyAdapter<dynamic>()
      ],
      effectMiddleware: [],
      middleware: <Middleware<dynamic>>[logMiddleware<dynamic>()],
    );
  },
);