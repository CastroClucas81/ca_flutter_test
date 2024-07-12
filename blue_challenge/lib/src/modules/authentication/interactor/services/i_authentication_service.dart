import 'package:blue_challenge/src/modules/authentication/interactor/dtos/credential_dto.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/states/authentication_state.dart';

abstract class IAuthenticationService {
  Future<AuthenticationState> loginWithEmailAndPassword(
    CredentialDTO dto,
  );

  Future<AuthenticationState> checkAuthentication();

  Future<void> signOut();
}
