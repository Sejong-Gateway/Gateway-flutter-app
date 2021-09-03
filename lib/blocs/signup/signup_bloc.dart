import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gateway/blocs/signup/signup_event.dart';
import 'package:gateway/blocs/signup/signup_state.dart';
import 'package:gateway/models/auth/signup_request.dart';
import 'package:gateway/models/common.dart';
import 'package:gateway/models/error.dart';
import 'package:gateway/service/auth/auth_service.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupLoadInProgress());

  Map<String, dynamic> signUpRequest = {};

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupWillLoad) {
      yield* this._mapSignupWillLoadToState(event);
    } else if (event is SignupValueWillChange) {
      yield* this._mapSignupValueWillChangeToState(event);
    } else if (event is SignupWillRegistered) {
      yield* this._mapSignupWillRegisteredToState(event);
    }
  }

  Stream<SignupState> _mapSignupValueWillChangeToState(
      SignupValueWillChange event) async* {
    signUpRequest[event.name] = event.value;

    yield SignupDateInputted(
      input: signUpRequest,
      signUpRequest: SignUpRequest.fromMap(signUpRequest),
    );
    print(SignUpRequest.fromMap(signUpRequest).currentSubjectUUIDs);

  }

  Stream<SignupState> _mapSignupWillLoadToState(SignupWillLoad event) async* {
    try {
      yield SignupLoadSuccess();
    } on APIError catch (error) {
      yield SignupLoadFailure(message: error.message);
    }
  }

  Stream<SignupState> _mapSignupWillRegisteredToState(
      SignupWillRegistered event) async* {
    SignupState _state = this.state;
    try {
      if ( _state is SignupDateInputted ){
        await AuthService.signUp(_state.signUpRequest);
        yield SignupSuccess();
      }
    } on APIError catch (error) {
      yield SignupLoadFailure(message: error.message);
    }
  }
}
