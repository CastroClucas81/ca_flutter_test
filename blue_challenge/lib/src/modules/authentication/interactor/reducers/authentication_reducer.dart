import 'package:asp/asp.dart';
import 'package:blue_challenge/generated/l10n.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/atoms/authentication_atom.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/services/i_authentication_service.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/states/authentication_state.dart';

class AuthenticationReducer extends Reducer {
  final IAuthenticationService _authenticationService;

  AuthenticationReducer({
    required IAuthenticationService authenticationService,
  }) : _authenticationService = authenticationService {
    on(() => [checkAuthenticationAction], _checkAuthentication);
    on(() => [logoutAction], _signOut);
    on(() => [loginWithEmailAndPasswordState], _loginWithEmailAndPassword);
  }

  Future<void> _checkAuthentication() async {
    final unlogged =
        (() => authenticationState.setValue(UnloggedAuthentication()));

    (await _authenticationService.checkAuthentication()).fold(
      (failure) {
        unlogged();
      },
      (tokenization) {
        if (tokenization == null) return unlogged();

        authenticationState
            .setValue(LoggedAuthentication(tokenization: tokenization));
      },
    );
  }

  Future<void> _loginWithEmailAndPassword() async {
    authenticationState.setValue(LoadingAuthentication());

    final dto = loginWithEmailAndPasswordState.value;
    final error = (() => authenticationState.setValue(
          ErrorAuthentication(
            message: S().unableToLogin,
          ),
        ));

    (await _authenticationService.loginWithEmailAndPassword(dto)).fold(
      (failure) {
        error();
      },
      (tokenization) {
        if (tokenization == null) return error();

        authenticationState
            .setValue(LoggedAuthentication(tokenization: tokenization));
      },
    );
  }

  Future<void> _signOut() async {
    _authenticationService.signOut().then(
          (value) => authenticationState.setValue(
            UnloggedAuthentication(),
          ),
        );
  }
}
