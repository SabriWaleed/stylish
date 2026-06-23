import 'package:dio/dio.dart';
import 'package:ecommerce_project/Core/errors/failure.dart';
import 'package:ecommerce_project/Core/networking/api_consumer.dart';
import 'package:ecommerce_project/Core/networking/api_endpoints.dart';
import 'package:ecommerce_project/Core/networking/api_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// الملف ده هتاخده كوبي بيست في اي مشروع ولكن هتغير حاجات بسيطه حسب الداتا ال رجعهالك
class DioConsumer implements ApiConsumer {
  final Dio dio;
  //  ده علشان  لما احب مثلا اغير طريقه الديوو  لريتروفيت  اقوم مغير في الملف ده بس فاكدا كلين كود وجميل جدا
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiEndpoints.baseUrl;
    dio.interceptors.add(ApiInterceptors(dio));
    dio.interceptors.add(
      PrettyDioLogger(
        // بتطبع شكل الريكوست والريسبونس والايرورز بشكل منظم
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }
  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        queryParameters: queryParameters,
        data: isFormData
            ? FormData.fromMap(data as Map<String, dynamic>)
            : data,
      );
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    } catch (e) {
      throw ServerFailure(errorMessage: 'Unexpected error: $e', message: null);
    }
  }

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        data: isFormData
            ? FormData.fromMap(data as Map<String, dynamic>)
            : data,
      );
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    } catch (e) {
      throw ServerFailure(errorMessage: 'Unexpected error: $e', message: null);
    }
  }

  @override
  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        queryParameters: queryParameters,
        data: isFormData
            ? FormData.fromMap(data as Map<String, dynamic>)
            : data,
      );
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    } catch (e) {
      throw ServerFailure(errorMessage: 'Unexpected error: $e', message: null);
    }
  }

  @override
  Future<dynamic> delete(String path, {bool isFormData = false}) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap({}) : null,
      );
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    } catch (e) {
      throw ServerFailure(errorMessage: 'Unexpected error: $e', message: null);
    }
  }
}
