import 'dart:developer';

import 'package:asp/asp.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/atoms/authentication_atom.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/services/i_authentication_service.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/states/authentication_state.dart';

class AuthenticationReducer extends Reducer {
  final IAuthenticationService _authenticationService;

  AuthenticationReducer({
    required IAuthenticationService authenticationService,
  }) : _authenticationService = authenticationService {
    log('dsfdsffsdfsdfsdfsdfsd');

    on(() => [checkAuthenticationAction], _checkAuthentication);
    on(() => [logoutAction], _signOut);
    on(() => [loginWithEmailAndPasswordState], _loginWithEmailAndPassword);
  }

  void _checkAuthentication() {
    _authenticationService.checkAuthentication().then(
          (value) => authenticationState.setValue(value),
        );
  }

  void _loginWithEmailAndPassword() {
    final dto = loginWithEmailAndPasswordState.value;

    _authenticationService.loginWithEmailAndPassword(dto).then(
          (value) => authenticationState.setValue(value),
        );
  }

  void _signOut() {
    _authenticationService.signOut().then(
          (value) => authenticationState.setValue(
            UnloggedAuthentication(),
          ),
        );
  }
}
