import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TestComponent extends Component<TestState> {
  TestComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TestState>(
                adapter: null,
                slots: <String, Dependent<TestState>>{
                }),);

}
