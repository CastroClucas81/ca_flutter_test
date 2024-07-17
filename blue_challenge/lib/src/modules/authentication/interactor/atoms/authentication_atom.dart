import 'package:asp/asp.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/dtos/credential_dto.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/states/authentication_state.dart';

/// states
final authenticationState = Atom<AuthenticationState>(
  InitialAuthentication(),
  key: 'authenticationState',
);

final loginWithEmailAndPasswordState = Atom<CredentialDTO>(
  CredentialDTO.empty(),
  key: 'credentialState',
);

/// actions
final checkAuthenticationAction = Atom.action(
  key: 'checkAuthenticationAction',
);

final logoutAction = Atom.action(
  key: 'logoutAction',
);
