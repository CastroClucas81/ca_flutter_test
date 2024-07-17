import 'package:blue_challenge/src/modules/authentication/interactor/entities/tokenization_entity.dart';
import 'package:equatable/equatable.dart';

sealed class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialAuthentication extends AuthenticationState {}

class LoadingAuthentication extends AuthenticationState {}

class ErrorAuthentication extends AuthenticationState {
  final String message;

  ErrorAuthentication({required this.message});

  @override
  List<Object?> get props => [message];
}

class UnloggedAuthentication extends AuthenticationState {}

class LoggedAuthentication extends AuthenticationState {
  final TokenizationEntity tokenization;

  LoggedAuthentication({required this.tokenization});

  @override
  List<Object?> get props => [tokenization];
}
