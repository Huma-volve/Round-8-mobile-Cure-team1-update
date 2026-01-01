import 'package:dio/dio.dart';

class ApiServices {
  static String basURL = "https://round8-backend-team-one.huma-volve.com/api/";
  final Dio _dio;
  const ApiServices(this._dio);

  String _resolveUrl(String endpoint) {
    if (endpoint.startsWith('http://') || endpoint.startsWith('https://')) {
      return endpoint;
    }
    return '$basURL$endpoint';
  }

  get(endpoint, [Map<String, dynamic>? headers]) async {
    Response respons = await _dio.get(
      _resolveUrl(endpoint),
      options: Options(headers: headers),
    );
    return respons.data;
  }

  post(endpoint, Object data) async {
    Response respons = await _dio.post(_resolveUrl(endpoint), data: data);
    return respons.data;
  }

  postFormData(endpoint, FormData data) async {
    Response respons = await _dio.post(_resolveUrl(endpoint), data: data);
    return respons.data;
  }

  postForLogout(
    endpoint,
  ) async {
    Response respons = await _dio.post(
      'https://round8-backend-team-one.huma-volve.com/api/profile/logout',
    );
    return respons.data;
  }

  put(
    endpoint,
    Map data,
  ) async {
    Response response = await _dio.put(
      _resolveUrl(endpoint),
      data: data,
    );
    return response.data;
  }

  delete(endpoint) async {
    Response respons = await _dio.delete(_resolveUrl(endpoint));
    return respons.data;
  }

  delet(endpoint, Map data) async {
    Response respons = await _dio.delete(_resolveUrl(endpoint), data: data);
    return respons.data;
  }

  post2(
      {required String endpoint,
      required Map<String, dynamic> body,
      required Map<String, dynamic> headers}) async {
    Response response = await _dio.post('$basURL$endpoint',
        data: body, options: Options(headers: headers));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw Exception(response.data['message'] ?? 'Unknown error');
    }
  }
}
