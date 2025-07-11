import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/generated/l10n.dart';

import '../widgets/app_dialog.dart';

void showAboutDialogHelper(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AppDialog(
      title: S.of(context).aboutDescription,
      description: S.of(context).aboutDescription,
      buttonText: S.of(context).okay,
      image: Image.asset(
        'assets/images/pngs/tmdb_logo.png',
        height: 48.w,
        width: 52.w,
      ),
    ),
  );
}
