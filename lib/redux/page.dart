import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo/redux/effect.dart';
import 'package:flutter_demo/redux/reducer.dart';
import 'package:flutter_demo/redux/state.dart';
import 'package:flutter_demo/redux/view.dart';

class testPage extends Page<testState, Map<String, dynamic>> {
  testPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<testState>(
              adapter: null,
              slots: <String, Dependent<testState>>{}
              ),
              middleware: <Middleware<testState>>[],
        );
}
