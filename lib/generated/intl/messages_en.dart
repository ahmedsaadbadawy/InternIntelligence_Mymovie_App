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

  static String m0(role) =>
      "${Intl.select(role, {'admin': 'Hi admin!', 'manager': 'Hi manager!', 'other': 'Hi visitor!'})}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutDescription": MessageLookupByLibrary.simpleMessage(
      "This product uses the TMDb API but is not endorsed or certified by TMDb. This app is developed for education purpose.",
    ),
    "aboutUs": MessageLookupByLibrary.simpleMessage("About Us"),
    "comingSoon": MessageLookupByLibrary.simpleMessage("Coming Soon"),
    "downloads": MessageLookupByLibrary.simpleMessage("Downloads"),
    "favoriteMovies": MessageLookupByLibrary.simpleMessage("Favorite Movies"),
    "feedback": MessageLookupByLibrary.simpleMessage("Feedback"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "nowPlaying": MessageLookupByLibrary.simpleMessage("Now Playing"),
    "okay": MessageLookupByLibrary.simpleMessage("Okay"),
    "pageHomeWelcomeRole": m0,
    "popular": MessageLookupByLibrary.simpleMessage("Popular"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchUse": MessageLookupByLibrary.simpleMessage(
      "Use the search icon to find movies",
    ),
  };
}
