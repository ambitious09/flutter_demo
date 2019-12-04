import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum testAction { add,onAdd ,refash,Onrefash}

class testActionCreator {
  static Action add() {

    return const Action(testAction.add);
  }
  static Action refash() {

    return const Action(testAction.refash);
  }
  static Action Onrefash() {

    return const Action(testAction.Onrefash);
  }
  static Action onAdd() {
    print("ac");
    return const Action(testAction.onAdd);
  }
}
