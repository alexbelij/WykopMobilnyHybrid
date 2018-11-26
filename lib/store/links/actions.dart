import 'package:owmflutter/api/api.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';

ThunkAction<AppState> loadPromoted() {
  return (Store<AppState> store) async {
    store.dispatch(loadItems("PROMOTED", (page) => api.links.getPromoted(page),
        store.state.linksState.promotedState.listState));
  };
}