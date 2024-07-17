import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/dtos/credential_dto.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/entities/tokenization_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthenticationService {
  Future<Either<Failure, TokenizationEntity?>> loginWithEmailAndPassword(
    CredentialDTO dto,
  );

  Future<Either<Failure, TokenizationEntity?>> checkAuthentication();

  Future<Either<Failure, Unit>> signOut();
}
