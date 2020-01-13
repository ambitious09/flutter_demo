import 'package:fish_redux/fish_redux.dart';
import 'reducer.dart';
import 'state.dart';


class GlobalStore{
  static Store<GlobalState> _globalstore;

  static Store<GlobalState>  get store =>_globalstore ??= createStore<GlobalState>(GlobalState(), buildReducer());

}