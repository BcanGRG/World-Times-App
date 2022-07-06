import 'package:dio/dio.dart';
import 'package:world_times_app/core/extensions/network_extension.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;
  late Dio _dio;

  NetworkManager._init() {
    _dio = Dio(BaseOptions(baseUrl: NetworkRoute.BASE_URL.rawValue!));
  }

  Future dioGet({
    required String endPoint,
  }) async {
    final response = await _dio.get(
      endPoint,
    );
    return response;
  }

  Future dioPost({
    dynamic data,
    required String endPoint,
  }) async {
    final response = await _dio.post(
      endPoint,
      data: data,
    );
    return response;
  }
}
