import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/utils/app_router.dart';
import 'Core/utils/themes/theme_color.dart';
import 'di/get_it.dart' as getit;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  // print('API_KEY: ${dotenv.env['API_KEY']}');
  unawaited(getit.init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColor.royalBlue,
        )),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
