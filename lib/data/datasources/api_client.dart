import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../Core/utils/api_constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
      queryParameters: {
        'api_key': dotenv.env['API_KEY'],
      },
    );
  }

  Future<dynamic> get(String path) async {
    try {
      final response = await _dio.get(path);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
