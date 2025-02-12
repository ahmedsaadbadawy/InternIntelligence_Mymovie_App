import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'di/get_it.dart' as getit;
import 'Core/errors/app_error.dart';
import 'domain/usecases/no_params.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/usecases/get_trending.dart';
import 'presentaion/views/homa_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  //print('API_KEY: ${dotenv.env['API_KEY']}');
  unawaited(getit.init());
  GetTrending getTrending = getit.getItInstance<GetTrending>();
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending(NoParams());
  eitherResponse.fold(
    (l) {
      print('error');
      print(l);
    },
    (r) {
      print('list of movies');
      print(r);
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
