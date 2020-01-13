import 'package:fish_redux/fish_redux.dart';

class TitleState implements Cloneable<TitleState> {
    int total;
    int done;

    TitleState({this.total = 0,this.done = 0});

  @override
  TitleState clone() {
    return TitleState()
    ..total=total
    ..done=done;
  }
}

//TitleState initState(Map<String, dynamic> args) {
//  return TitleState();
//}
