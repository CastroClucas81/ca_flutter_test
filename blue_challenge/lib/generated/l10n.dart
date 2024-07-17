// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Unexpected error`
  String get unexpectedError {
    return Intl.message(
      'Unexpected error',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred`
  String get anUnexpectedErrorOcurrend {
    return Intl.message(
      'An unexpected error occurred',
      name: 'anUnexpectedErrorOcurrend',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get internalServerError {
    return Intl.message(
      'Internal server error',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `canceled request`
  String get canceledRequest {
    return Intl.message(
      'canceled request',
      name: 'canceledRequest',
      desc: '',
      args: [],
    );
  }

  /// `No Internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Unable to login`
  String get unableToLogin {
    return Intl.message(
      'Unable to login',
      name: 'unableToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Good to see you here again!`
  String get goodToSeeYouHereAgain {
    return Intl.message(
      'Good to see you here again!',
      name: 'goodToSeeYouHereAgain',
      desc: '',
      args: [],
    );
  }

  /// `How do you want to connect?`
  String get howDoYouWantToConnect {
    return Intl.message(
      'How do you want to connect?',
      name: 'howDoYouWantToConnect',
      desc: '',
      args: [],
    );
  }

  /// `Continue with an email`
  String get continueWithAnEmail {
    return Intl.message(
      'Continue with an email',
      name: 'continueWithAnEmail',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the data`
  String get fillInTheData {
    return Intl.message(
      'Fill in the data',
      name: 'fillInTheData',
      desc: '',
      args: [],
    );
  }

  /// `You didn't favorite any Pokémon :(`
  String get youDidntFavoriteAnyPokemon {
    return Intl.message(
      'You didn\'t favorite any Pokémon :(',
      name: 'youDidntFavoriteAnyPokemon',
      desc: '',
      args: [],
    );
  }

  /// `Click on the heart icon of your favorite Pokémon and they will appear here.`
  String get clickOnTheHeartIconOfYourFavorite {
    return Intl.message(
      'Click on the heart icon of your favorite Pokémon and they will appear here.',
      name: 'clickOnTheHeartIconOfYourFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Whoops!!`
  String get whoops {
    return Intl.message(
      'Whoops!!',
      name: 'whoops',
      desc: '',
      args: [],
    );
  }

  /// `No Internet connection was found. Check your Internet connection or try again!`
  String get noInternetConnectionWasFound {
    return Intl.message(
      'No Internet connection was found. Check your Internet connection or try again!',
      name: 'noInternetConnectionWasFound',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Search for pokemon...`
  String get searchForPokemon {
    return Intl.message(
      'Search for pokemon...',
      name: 'searchForPokemon',
      desc: '',
      args: [],
    );
  }

  /// `Stats`
  String get stats {
    return Intl.message(
      'Stats',
      name: 'stats',
      desc: '',
      args: [],
    );
  }

  /// `Evolutions`
  String get evolutions {
    return Intl.message(
      'Evolutions',
      name: 'evolutions',
      desc: '',
      args: [],
    );
  }

  /// `Level {x}`
  String levelX(Object x) {
    return Intl.message(
      'Level $x',
      name: 'levelX',
      desc: '',
      args: [x],
    );
  }

  /// `No Results Found`
  String get noResultsFound {
    return Intl.message(
      'No Results Found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Description: We couldn't find any matching results. Please try refining your search.`
  String get weCouldFindAnyMatchingResults {
    return Intl.message(
      'Description: We couldn\'t find any matching results. Please try refining your search.',
      name: 'weCouldFindAnyMatchingResults',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again later or contact support.`
  String get anErrorOcurredPleaseTryAgain {
    return Intl.message(
      'An error occurred. Please try again later or contact support.',
      name: 'anErrorOcurredPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `No more data`
  String get noMoreData {
    return Intl.message(
      'No more data',
      name: 'noMoreData',
      desc: '',
      args: [],
    );
  }

  /// `Nº {x}`
  String nX(Object x) {
    return Intl.message(
      'Nº $x',
      name: 'nX',
      desc: '',
      args: [x],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Ability`
  String get ability {
    return Intl.message(
      'Ability',
      name: 'ability',
      desc: '',
      args: [],
    );
  }

  /// `Your Favorite Pokemons`
  String get yourFavoritePokemons {
    return Intl.message(
      'Your Favorite Pokemons',
      name: 'yourFavoritePokemons',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your logout`
  String get confirmYoutLogout {
    return Intl.message(
      'Confirm your logout',
      name: 'confirmYoutLogout',
      desc: '',
      args: [],
    );
  }

  /// `Attention`
  String get attention {
    return Intl.message(
      'Attention',
      name: 'attention',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Undefined`
  String get undefined {
    return Intl.message(
      'Undefined',
      name: 'undefined',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
