import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:wiredash/wiredash.dart';

class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({
    super.key,
  });

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      decoration: const BoxDecoration(color: Colors.black54),
      child: Column(
        children: [
          const Center(
            heightFactor: 2,
            child: Text('Dialogs', style: TextStyle(fontSize: 20)),
          ),
          ListTile(
            title: Text(S.of(context).feedback,
                style: const TextStyle(fontSize: 16)),
            onTap: () {
              // Inherits the Material theme's secondary color as the main color
              // Wiredash.of(context).show(inheritMaterialTheme: true);
              Wiredash.of(context).show();
            },
          ),
          ExpansionTile(
            title: Text(S.of(context).language),
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                  if (Intl.getCurrentLocale() != 'en') {
                    S.load(const Locale('en'));
                    setState(() {});
                  }
                },
              ),
              ListTile(
                title: const Text('العربيه'),
                onTap: () {
                  if (Intl.getCurrentLocale() != 'ar') {
                    S.load(const Locale('ar'));
                    setState(() {});
                  }
                },
              ),
            ],
          ),
          ListTile(
            title: Text(S.of(context).aboutUs,
                style: const TextStyle(fontSize: 16)),
            onTap: () {
              // Handle item 2 tap
            },
          ),
        ],
      ),
    );
  }
}
