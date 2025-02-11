import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'data/datasources/api_client.dart';
import 'data/datasources/movie_remote_data_source.dart';
import 'presentaion/views/homa_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  print('API_KEY: ${dotenv.env['API_KEY']}');
  ApiClient apiClient = ApiClient(Dio());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  dataSource.getTrending();
  dataSource.getPopular();
  dataSource.getPlayingNow();
  dataSource.getComingSoon();
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
