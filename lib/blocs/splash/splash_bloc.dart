import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gateway/blocs/splash/splash_event.dart';
import 'package:gateway/blocs/splash/splash_state.dart';
import 'package:gateway/models/auth/user.dart';
import 'package:gateway/models/error.dart';
import 'package:gateway/service/auth/auth_service.dart';
import 'package:gateway/service/common/token.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  SplashBloc() : super(SplashLoadInProgress());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is SplashWillLoad) {
      yield* this._mapSplashWillLoadToState(event);
    }
  }

  Stream<SplashState> _mapSplashWillLoadToState(SplashWillLoad event) async* {
    try {
      String accessToken = await TokenService().getAccessToken();
      if ( accessToken != null ){

        User user = await AuthService.getUserInfo(accessToken);

        yield SplashLoggedIn();
      }
      else{
        yield SplashNotLoggedIn();
      }
    } on APIError catch(error) {
      yield SplashNotLoggedIn();
      yield SplashLoadFailure(message: error.message);
    }
  }
}
