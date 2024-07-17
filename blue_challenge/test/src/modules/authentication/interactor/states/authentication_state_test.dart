import 'package:blue_challenge/src/modules/authentication/interactor/entities/tokenization_entity.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/states/authentication_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationState subclasses', () {
    test('InitialAuthentication should be equal when props are the same', () {
      final state1 = InitialAuthentication();
      final state2 = InitialAuthentication();

      expect(state1, equals(state2));
    });

    test('LoadingAuthentication should be equal when props are the same', () {
      final state1 = LoadingAuthentication();
      final state2 = LoadingAuthentication();

      expect(state1, equals(state2));
    });

    test('ErrorAuthentication should be equal when props are the same', () {
      final state1 = ErrorAuthentication(message: 'Error message');
      final state2 = ErrorAuthentication(message: 'Error message');

      expect(state1, equals(state2));
    });

    test('UnloggedAuthentication should be equal when props are the same', () {
      final state1 = UnloggedAuthentication();
      final state2 = UnloggedAuthentication();

      expect(state1, equals(state2));
    });

    test('LoggedAuthentication should be equal when props are the same', () {
      const tokenization1 = TokenizationEntity(tokenId: 'token1');
      const tokenization2 = TokenizationEntity(tokenId: 'token1');

      final state1 = LoggedAuthentication(tokenization: tokenization1);
      final state2 = LoggedAuthentication(tokenization: tokenization2);

      expect(state1, equals(state2));
    });

    test('LoggedAuthentication should not be equal when tokenization differs',
        () {
      const tokenization1 = TokenizationEntity(tokenId: 'token1');
      const tokenization2 = TokenizationEntity(tokenId: 'token2');

      final state1 = LoggedAuthentication(tokenization: tokenization1);
      final state2 = LoggedAuthentication(tokenization: tokenization2);

      expect(state1, isNot(equals(state2)));
    });

    test('ErrorAuthentication should not be equal when message differs', () {
      final state1 = ErrorAuthentication(message: 'Error message 1');
      final state2 = ErrorAuthentication(message: 'Error message 2');

      expect(state1, isNot(equals(state2)));
    });
  });
}
