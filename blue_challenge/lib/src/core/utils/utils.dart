class Utils {
  static String extractIdFromUrl(String url) {
    final id = url.split('/').lastWhere((element) => element.isNotEmpty);

    return id;
  }

  static String handlePokemonGif({required String id}) {
    return '${const String.fromEnvironment('baseGifUrl')}/$id.gif';
  }
}
