import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<testState> buildReducer() {
  return asReducer(
    <Object, Reducer<testState>>{
      testAction.add: _add,
      testAction.refash:_refash,
    },
  );
}
testState _refash(testState state,Action action){
  final testState newState=state.clone();
    newState.isRefash=state.isRefash;
}

testState _add(testState state, Action action) {
  final testState newState = state.clone();
  print("触发加说");
  newState.count= ++state.count;
  return newState;
}
