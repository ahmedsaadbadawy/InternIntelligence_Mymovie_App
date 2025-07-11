import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:wiredash/wiredash.dart';
import '../../Core/utils/themes/theme_color.dart';

class WiredashApp extends StatelessWidget {
  final Widget child;

  const WiredashApp({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: dotenv.env['WIREDASH_PROJECT_ID']!,
      secret: dotenv.env['WIREDASH_SECRET']!,
      //navigatorKey: navigatorKey,
      options: WiredashOptionsData(
        locale: Locale(
          Intl.getCurrentLocale(),
        ),
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: AppColor.vulcan,
        //dividerColor: AppColor.vulcan,
      ),
      child: child,
    );
  }
}
