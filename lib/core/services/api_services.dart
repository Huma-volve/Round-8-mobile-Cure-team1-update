import 'package:dio/dio.dart';

class ApiServices {
  static String basURL = "https://round8-backend-team-one.huma-volve.com/api/";
  final Dio _dio;
  const ApiServices(this._dio);
  get(endpoint, [Map<String, dynamic>? headers]) async {
    Response respons = await _dio.get(
      '$basURL$endpoint',
      options: Options(headers: headers),
    );
    return respons.data;
  }

  post(
      {required String endpoint,
      required Map<String,dynamic> body,
      required Map<String, dynamic> headers})async {
  Response response=await  _dio.post('$basURL$endpoint',
        data: body, options: Options(headers: headers));
        if(response.statusCode==200|| response.statusCode==201)
        {
          return response.data;
        }
        else{
         throw Exception(
       
       response.data['message'] ?? 'Unknown error'
      );
        }
  }

  put(endpoint, Map data, token) async {
    Response response = await _dio.put(
      '$endpoint',
      data: data,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response.data;
  }

  delet(endpoint, Map data) async {
    Response respons = await _dio.delete('$basURL$endpoint', data: data);
    return respons.data;
  }

}
