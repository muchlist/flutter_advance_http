import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'json_parsers/json_parsers.dart';

class RequestREST {
  final String endpoint;
  final Map<String, String> data;

  const RequestREST({@required this.endpoint, this.data = const{}});

  /* // Jika konek ke berbagai macam api maka Dio Client harus dibuat inject dari luar
  final Dio client;
  final String endpoint;
  final Map<String, String> data;

  const RequestREST({@required this.client ,@required this.endpoint, this.data = const{}});
  */

  /// HTTP dio client
  static final _client = Dio(BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      connectTimeout: 3000, // 3 second
      receiveTimeout: 3000,
      headers: <String, String>{
        "api-key": "auth token",
      }));

  Future<T> executeGet<T>(JsonParser<T> parser) async {
    final response = await _client.get<String>(endpoint);
    return parser.parseFromJson(response.data);
  }

  Future<T> executePost<T>(JsonParser<T> parser) async {
    final formData = FormData.fromMap(data);
    final response = await _client.post<String>(endpoint, data: formData);
    return parser.parseFromJson(response.data);
  }
}
