import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<testState> buildEffect() {
  return combineEffects(<Object, Effect<testState>>{
    testAction.onAdd: _onAction,
    testAction.Onrefash:_Onrefash
  });
}

void _onAction(Action action, Context<testState> ctx) {
  print("eff");
  ctx.dispatch(testActionCreator.add());
}

void _Onrefash(Action action, Context<testState> ctx) {
  ctx.dispatch(testActionCreator.refash());
}
