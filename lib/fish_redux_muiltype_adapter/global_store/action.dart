import 'package:fish_redux/fish_redux.dart';

enum GlobalAction { changeThemeColor }

class GlobalActionCreator {
  static Action onAction() {
    return const Action(GlobalAction.changeThemeColor);
  }
}
