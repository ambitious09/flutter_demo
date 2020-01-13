import 'package:fish_redux/fish_redux.dart';

class TestState implements Cloneable<TestState> {
  String test;


  TestState({this.test});
  @override
  TestState clone() {
    return TestState()
    ..test=test;
  }
}

TestState initState(Map<String, dynamic> args) {
  return TestState();
}
