import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/atoms/authentication_atom.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/dtos/credential_dto.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/entities/tokenization_entity.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/reducers/authentication_reducer.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/services/i_authentication_service.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/states/authentication_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationService extends Mock
    implements IAuthenticationService {}

void main() {
  late AuthenticationReducer authenticationReducer;
  late MockAuthenticationService mockAuthenticationService;

  setUp(() {
    mockAuthenticationService = MockAuthenticationService();
    authenticationReducer =
        AuthenticationReducer(authenticationService: mockAuthenticationService);

    registerFallbackValue(
      CredentialDTO(email: 'test@example.com', password: 'password'),
    );
  });

  tearDown(() {
    reset(mockAuthenticationService);
    authenticationReducer.dispose();
  });

  group('AuthenticationReducer', () {
    test('initial state is InitialAuthentication', () {
      expect(authenticationState.value, isA<InitialAuthentication>());
    });

    test('checkAuthentication sets UnloggedAuthentication when service fails',
        () async {
      when(() => mockAuthenticationService.checkAuthentication()).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'message')));

      checkAuthenticationAction();

      expect(
        authenticationState.buffer(1),
        completion([isA<UnloggedAuthentication>()]),
      );
    });

    test('checkAuthentication sets LoggedAuthentication when service succeeds',
        () async {
      const tokenization = TokenizationEntity(tokenId: 'testToken');

      when(() => mockAuthenticationService.checkAuthentication())
          .thenAnswer((_) async => const Right(tokenization));

      checkAuthenticationAction();

      expect(
        authenticationState.buffer(1),
        completion([isA<LoggedAuthentication>()]),
      );
    });

    test(
        'checkAuthentication sets UnloggedAuthentication when service succeeds',
        () async {
      when(() => mockAuthenticationService.checkAuthentication())
          .thenAnswer((_) async => const Right(null));

      checkAuthenticationAction();

      expect(
        authenticationState.buffer(1),
        completion([isA<UnloggedAuthentication>()]),
      );
    });

    test('loginWithEmailAndPassword sets ErrorAuthentication on failure',
        () async {
      final dto =
          CredentialDTO(email: 'test@example.com', password: 'password');

      when(() => mockAuthenticationService.loginWithEmailAndPassword(any()))
          .thenAnswer(
              (_) async => const Left(UnexpectedFailure(message: 'message')));

      loginWithEmailAndPasswordState.setValue(dto);

      expect(
        authenticationState.buffer(1),
        completion([
          isA<ErrorAuthentication>(),
        ]),
      );
    });

    test('loginWithEmailAndPassword sets LoggedAuthentication on success',
        () async {
      final dto =
          CredentialDTO(email: 'test@example.com', password: 'password');
      const tokenization = TokenizationEntity(tokenId: 'tokenId');

      when(() => mockAuthenticationService.loginWithEmailAndPassword(any()))
          .thenAnswer((_) async => const Right(tokenization));

      loginWithEmailAndPasswordState.setValue(dto);

      expect(
        authenticationState.buffer(1),
        completion([
          isA<LoggedAuthentication>(),
        ]),
      );
    });

    test('logout sets UnloggedAuthentication', () async {
      when(() => mockAuthenticationService.signOut())
          .thenAnswer((_) async => const Right(unit));

      logoutAction();

      expect(
        authenticationState.buffer(1),
        completion([
          isA<UnloggedAuthentication>(),
        ]),
      );
    });
  });
}
