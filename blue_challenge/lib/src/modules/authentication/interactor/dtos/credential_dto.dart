class CredentialDTO {
  final String email;
  final String password;

  CredentialDTO({
    required this.email,
    required this.password,
  });

  CredentialDTO.empty()
      : email = '',
        password = '';
}
