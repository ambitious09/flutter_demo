import 'package:fish_redux/fish_redux.dart';
import 'test/state.dart';
import 'todo_component/component.dart';

enum PageAction {initTools, onAdd,initTest,initbases}

class PageActionCreator {
  static Action initToolsAction(List<ToDoState> toDos){
    return Action(PageAction.initTools,payload: toDos);

  }
  static Action initTestAction(List<TestState> toDos){
    return Action(PageAction.initTest,payload: toDos);

  }
  static Action initbasesAction(List<Cloneable> toDos){
    return Action(PageAction.initbases,payload: toDos);

  }

  static Action onAddAction() {
    return const Action(PageAction.onAdd);
  }

}
