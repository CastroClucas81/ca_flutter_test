enum DatabaseResultEnum {
  success(true, 1),
  error(false, 0),
  unknown(false, -1);

  const DatabaseResultEnum(this.isSuccess, this.code);

  final bool isSuccess;
  final int code;

  factory DatabaseResultEnum.fromCode(int code) =>
      DatabaseResultEnum.values.firstWhere(
        (el) => el.code == code,
        orElse: () => DatabaseResultEnum.unknown,
      );
}
