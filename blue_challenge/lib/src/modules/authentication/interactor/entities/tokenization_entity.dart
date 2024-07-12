import 'package:equatable/equatable.dart';

class TokenizationEntity extends Equatable {
  final String tokenId;
  final String? refreshToken;

  const TokenizationEntity({
    required this.tokenId,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [tokenId, refreshToken];
}
