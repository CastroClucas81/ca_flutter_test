import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/dtos/credential_dto.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/entities/tokenization_entity.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/services/i_authentication_service.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService extends IAuthenticationService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthenticationService({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<Either<Failure, TokenizationEntity?>> checkAuthentication() async {
    try {
      final token = await _firebaseAuth.currentUser?.getIdToken();

      return Right(
        token != null ? TokenizationEntity(tokenId: token) : null,
      );
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TokenizationEntity?>> loginWithEmailAndPassword(
    CredentialDTO dto,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: dto.email,
        password: dto.password,
      );

      return await checkAuthentication();
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _firebaseAuth.signOut();

      return const Right(unit);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
