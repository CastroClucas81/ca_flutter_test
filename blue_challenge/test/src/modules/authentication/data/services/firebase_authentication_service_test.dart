import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/modules/authentication/data/services/firebase_authentication_service.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/dtos/credential_dto.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/entities/tokenization_entity.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/services/i_authentication_service.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late IAuthenticationService authService;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUser mockUser;
  late MockUserCredential mockUserCredential;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUser = MockUser();
    authService = FirebaseAuthenticationService(firebaseAuth: mockFirebaseAuth);
    mockUserCredential = MockUserCredential();
  });

  group(
    'FirebaseAuthenticationService',
    () {
      test(
          'checkAuthentication returns TokenizationEntity when token is not null',
          () async {
        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);

        when(() => mockUser.getIdToken()).thenAnswer((_) async => 'testToken');

        final result = await authService.checkAuthentication();

        expect(result.isRight(), true);
      });

      test('checkAuthentication returns null when token is null', () async {
        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(() => mockUser.getIdToken()).thenAnswer((_) async => null);

        final result = await authService.checkAuthentication();

        expect(result, const Right(null));
      });

      test('checkAuthentication returns UnexpectedFailure on exception',
          () async {
        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(() => mockUser.getIdToken()).thenThrow(Exception('error'));

        final result = await authService.checkAuthentication();

        expect(result, isA<Left>());
        expect(result.fold((l) => l, (r) => r), isA<UnexpectedFailure>());
      });

      test('loginWithEmailAndPassword signs in and checks authentication',
          () async {
        final dto = CredentialDTO(email: 'test@test.com', password: 'password');
        when(
          () => mockFirebaseAuth.signInWithEmailAndPassword(
            email: dto.email,
            password: dto.password,
          ),
        ).thenAnswer((_) async => mockUserCredential);

        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(() => mockUser.getIdToken()).thenAnswer((_) async => 'testToken');

        final result = await authService.loginWithEmailAndPassword(dto);

        expect(result, const Right(TokenizationEntity(tokenId: 'testToken')));
      });

      test('loginWithEmailAndPassword returns UnexpectedFailure on exception',
          () async {
        final dto = CredentialDTO(email: 'test@test.com', password: 'password');
        when(() => mockFirebaseAuth.signInWithEmailAndPassword(
              email: dto.email,
              password: dto.password,
            )).thenThrow(Exception('error'));

        final result = await authService.loginWithEmailAndPassword(dto);

        expect(result, isA<Left>());
        expect(result.fold((l) => l, (r) => r), isA<UnexpectedFailure>());
      });

      test('signOut signs out successfully', () async {
        when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async {});

        final result = await authService.signOut();

        expect(result.isRight(), true);
      });

      test('signOut returns UnexpectedFailure on exception', () async {
        when(() => mockFirebaseAuth.signOut()).thenThrow(Exception('error'));

        final result = await authService.signOut();

        expect(result, isA<Left>());
        expect(result.fold((l) => l, (r) => r), isA<UnexpectedFailure>());
      });
    },
  );
}
