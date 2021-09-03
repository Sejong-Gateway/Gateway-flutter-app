import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gateway/blocs/auth/auth_event.dart';
import 'package:gateway/blocs/auth/auth_state.dart';
import 'package:gateway/models/auth/signin_response.dart';
import 'package:gateway/models/common.dart';
import 'package:gateway/models/error.dart';
import 'package:gateway/service/auth/auth_service.dart';
import 'package:gateway/service/common/token.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoadInProgress());
  Map<String, dynamic> input = {};

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthWillLoad) {
      yield* this._mapAuthWillLoadToState(event);
    } else if (event is AuthTextFieldWillInputted) {
      yield* this._mapAuthTextFieldWillInputtedToState(event);
    } else if (event is AuthWillSignedIn) {
      yield* this._mapAuthWillSignedInToState(event);
    }
  }

  Stream<AuthState> _mapAuthWillLoadToState(AuthWillLoad event) async* {
    try {
      yield AuthTextFieldInputtedSuccess(input: Map<String, dynamic>());
    } on APIError catch (error) {
      yield AuthLoadFailure(message: error.message);
    }
  }

  Stream<AuthState> _mapAuthTextFieldWillInputtedToState(
      AuthTextFieldWillInputted event) async* {
    input[event.name] = event.value;
    yield AuthTextFieldInputtedSuccess(input: input);
  }

  Stream<AuthState> _mapAuthWillSignedInToState(AuthWillSignedIn event) async* {
    try {
      print(event);
      SignInResponse response = await AuthService.signIn(
        int.parse(input['studentId']),
        input['password'],
      );

      TokenService().setAccessToken(response.token);

      yield AuthSignInSuccess();
    } on APIError catch (error) {
      print(error.message);
      yield AuthLoadFailure(message: error.message);
    }
  }
}
