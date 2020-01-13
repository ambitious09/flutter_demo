import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

export 'state.dart';

class TitleComponent extends Component<TitleState> {
  TitleComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<TitleState>(
                adapter: null,
                slots: <String, Dependent<TitleState>>{
                }),);

}
