import 'dart:developer';

import 'package:blue_challenge/src/modules/authentication/interactor/dtos/credential_dto.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/entities/tokenization_entity.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/services/i_authentication_service.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/states/authentication_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService extends IAuthenticationService {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuthenticationState> checkAuthentication() async {
    final token = await _firebaseAuth.currentUser?.getIdToken();

    if (token == null) return UnloggedAuthentication();

    return LoggedAuthentication(
      tokenization: TokenizationEntity(tokenId: token),
    );
  }

  @override
  Future<AuthenticationState> loginWithEmailAndPassword(
      CredentialDTO dto) async {
    try {
      inspect(dto);

      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: dto.email,
        password: dto.password,
      );

      inspect(result);

      return await checkAuthentication();
    } catch (e) {
      log('dfsdfsfdsfd $e');
      return UnloggedAuthentication();
    }
  }

  @override
  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }
}
