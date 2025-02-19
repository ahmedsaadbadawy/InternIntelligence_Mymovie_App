import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentaion/views/movie_detail/movie_detail_screen.dart';
import 'package:movie_app/presentaion/views/movie_detail/widgets/movie_detail_arguments.dart';
import 'di/get_it.dart' as getit;
import 'presentaion/views/home/homa_screen.dart';

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
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const MovieDetailScreen(movieDetailArguments: MovieDetailArguments(845781),),
      ),
    );
  }
}
