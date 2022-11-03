
import 'package:dio/dio.dart';
class DioHelper {
  static Dio dio=Dio(BaseOptions(
    baseUrl: 'https://api.coingecko.com/api/v3/',
    receiveDataWhenStatusError: true,
  ),
  );



  static Future<Response> getData(
      {
        required String path,
        Map<String, dynamic>? query,
        bool? isEmailAndPasswordRequired,

      }) async {

    return await dio.get(path, queryParameters: query,);
  }

  static Future<Response> setData(
      {
        required String path,
        Map<String, dynamic>? query,
        required data,

      }) async {



    return await dio.post(
      path,
      data:data,
      queryParameters: query,

    );
  }

  static Future<Response> putData(
      {
        required String path,
        Map<String, dynamic>? query,
        required data,

      }) async {

    return await dio.put(
      path,
      data:data,
      queryParameters: query,
    );
  }


  static Future<Response> deleteData(
      {
        required String path,
        Map<String, dynamic>? query,
        data,

      }) async {
    return await dio.delete(
      path,
      data:data,
      queryParameters: query,
    );
  }


}