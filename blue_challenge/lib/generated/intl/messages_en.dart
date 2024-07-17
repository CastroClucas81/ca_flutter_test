// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(x) => "Level ${x}";

  static String m1(x) => "Nº ${x}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "ability": MessageLookupByLibrary.simpleMessage("Ability"),
        "anErrorOcurredPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "An error occurred. Please try again later or contact support."),
        "anUnexpectedErrorOcurrend": MessageLookupByLibrary.simpleMessage(
            "An unexpected error occurred"),
        "attention": MessageLookupByLibrary.simpleMessage("Attention"),
        "canceledRequest":
            MessageLookupByLibrary.simpleMessage("canceled request"),
        "clickOnTheHeartIconOfYourFavorite": MessageLookupByLibrary.simpleMessage(
            "Click on the heart icon of your favorite Pokémon and they will appear here."),
        "confirmYoutLogout":
            MessageLookupByLibrary.simpleMessage("Confirm your logout"),
        "continueWithAnEmail":
            MessageLookupByLibrary.simpleMessage("Continue with an email"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "enter": MessageLookupByLibrary.simpleMessage("Enter"),
        "evolutions": MessageLookupByLibrary.simpleMessage("Evolutions"),
        "fillInTheData":
            MessageLookupByLibrary.simpleMessage("Fill in the data"),
        "goodToSeeYouHereAgain":
            MessageLookupByLibrary.simpleMessage("Good to see you here again!"),
        "height": MessageLookupByLibrary.simpleMessage("Height"),
        "howDoYouWantToConnect":
            MessageLookupByLibrary.simpleMessage("How do you want to connect?"),
        "internalServerError":
            MessageLookupByLibrary.simpleMessage("Internal server error"),
        "levelX": m0,
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "nX": m1,
        "noInternetConnection":
            MessageLookupByLibrary.simpleMessage("No Internet connection"),
        "noInternetConnectionWasFound": MessageLookupByLibrary.simpleMessage(
            "No Internet connection was found. Check your Internet connection or try again!"),
        "noMoreData": MessageLookupByLibrary.simpleMessage("No more data"),
        "noResultsFound":
            MessageLookupByLibrary.simpleMessage("No Results Found"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "searchForPokemon":
            MessageLookupByLibrary.simpleMessage("Search for pokemon..."),
        "stats": MessageLookupByLibrary.simpleMessage("Stats"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "unableToLogin":
            MessageLookupByLibrary.simpleMessage("Unable to login"),
        "undefined": MessageLookupByLibrary.simpleMessage("Undefined"),
        "unexpectedError":
            MessageLookupByLibrary.simpleMessage("Unexpected error"),
        "weCouldFindAnyMatchingResults": MessageLookupByLibrary.simpleMessage(
            "Description: We couldn\'t find any matching results. Please try refining your search."),
        "weight": MessageLookupByLibrary.simpleMessage("Weight"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back!"),
        "whoops": MessageLookupByLibrary.simpleMessage("Whoops!!"),
        "youDidntFavoriteAnyPokemon": MessageLookupByLibrary.simpleMessage(
            "You didn\'t favorite any Pokémon :("),
        "yourFavoritePokemons":
            MessageLookupByLibrary.simpleMessage("Your Favorite Pokemons")
      };
}
