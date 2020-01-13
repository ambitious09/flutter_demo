import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';
import 'test/state.dart';
import 'todo_component/component.dart';
import 'list_Adapter/action.dart' as list_action;



Effect<PageState> buildEffect() {
  return combineEffects(<Object, Effect<PageState>>{
    Lifecycle.initState: _init,
    PageAction.onAdd: _onAdd,
  });
}

void _init(Action action, Context<PageState> ctx){
  final List<Cloneable> bases=<Cloneable>[];
  final List<ToDoState> initToDos = <ToDoState>[
    ToDoState(
      uniqueId: '0',
      title: 'Hello world',
      desc: 'Learn how to program.',
      isDone: true,
    ),
    ToDoState(
      uniqueId: '1',
      title: 'Hello Flutter',
      desc: 'Learn how to build a flutter application.',
      isDone: true,
    ),
    ToDoState(
      uniqueId: '2',
      title: 'How Fish Redux',
      desc: 'Learn how to use Fish Redux in a flutter application.',
      isDone: false,
    )
  ];
  ctx.dispatch(PageActionCreator.initToolsAction(initToDos));

  final List<TestState> initTests= <TestState>[
    TestState(test:"12"),
    TestState(test:"23"),
    TestState(test:"24"),
  ];
 ctx.dispatch(PageActionCreator.initTestAction(initTests));
//  bases.addAll(initTests);
//  bases.addAll(initTests);
//  ctx.dispatch(PageActionCreator.initbasesAction(bases));
}

void _onAdd(Action action, Context<PageState> ctx) {
  println("qw -");
  Navigator.of(ctx.context)
      .pushNamed('todo_edit', arguments: null)
      .then((dynamic toDo) {
    if (toDo != null &&
        (toDo.title?.isNotEmpty == true || toDo.desc?.isNotEmpty == true)) {
      ctx.dispatch(list_action.ToDoListActionCreator.add(toDo));
    }
  });
}
