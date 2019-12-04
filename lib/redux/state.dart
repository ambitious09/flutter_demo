import 'package:fish_redux/fish_redux.dart';


class testState implements Cloneable<testState> {
   int count=0;
   bool isRefash=false;
  @override
  testState clone() {
    return testState()
      ..count=count
      ..isRefash=isRefash;
  }
}

testState initState(Map<String, dynamic> args) {
  return testState();
}


//class testConn extends Cloneable<testState>{
//  @override
//  testState clone() {
//
//    return null;
//  }
//
//
//
//}

