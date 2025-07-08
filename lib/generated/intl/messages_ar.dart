// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(role) =>
      "${Intl.select(role, {'admin': 'مرحبا بك، ادمن!', 'manager': 'مرحبا بك، مدير!', 'other': 'مرحبا بك، زائر!'})}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutDescription": MessageLookupByLibrary.simpleMessage("وصف عنا"),
    "aboutUs": MessageLookupByLibrary.simpleMessage("من نحن"),
    "comingSoon": MessageLookupByLibrary.simpleMessage("قريبا"),
    "downloads": MessageLookupByLibrary.simpleMessage("التحميلات"),
    "feedback": MessageLookupByLibrary.simpleMessage("تعليق"),
    "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "language": MessageLookupByLibrary.simpleMessage("اللغة"),
    "nowPlaying": MessageLookupByLibrary.simpleMessage("يتم عرضه الآن"),
    "okay": MessageLookupByLibrary.simpleMessage("حسناً"),
    "pageHomeWelcomeRole": m0,
    "popular": MessageLookupByLibrary.simpleMessage("الأكثر شيوعا"),
    "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "search": MessageLookupByLibrary.simpleMessage("بحث"),
    "searchUse": MessageLookupByLibrary.simpleMessage(
      "يمكنك استخدام ايقونة البحث لتعثر على الأفلام",
    ),
  };
}
