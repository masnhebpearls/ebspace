import 'package:dio/dio.dart';

class ZohoDio {
  late Dio zohoDio;

  ZohoDio() {
    final Dio dio = Dio(
      BaseOptions(
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json,
        headers: <String, dynamic>{
          'Content-Type': 'application/json',
        },
      ),
    );
    zohoDio = dio;
  }
}
