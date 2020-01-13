import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ToDoEditAction { onDone, onChangeTheme }

class ToDoEditActionCreator {
  static Action onDone() {
    return const Action(ToDoEditAction.onDone);
  }

  static Action onChangeTheme() {
    return const Action(ToDoEditAction.onChangeTheme);
  }
}
