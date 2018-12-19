import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';

Reducer<AuthState> authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, SaveAuthCredentialsAction>(_saveLoginCredentials)
]);

AuthState _saveLoginCredentials(
    AuthState state, SaveAuthCredentialsAction action) {
  return state.rebuild((b) => b
    ..loggedIn = true
    ..avatarUrl = action.avatarUrl
    ..login = action.login
    ..backgroundUrl = action.backgroundUrl
    ..color = action.color
    ..avatarUrl = action.avatarUrl);
}
