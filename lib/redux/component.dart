import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class testComponent extends Component<testState> {
  testComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<testState>(
                adapter: null,
                slots: <String, Dependent<testState>>{
                }),);

}
