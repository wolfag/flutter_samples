import 'package:dio/dio.dart';
import 'package:getx_news/service/http_service.dart';

const BASE_URL = 'https://newsapi.org';
const API_KEY = '92d9e244a93d4b29a78ef4c3b0245d57';

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
          onError: (DioError error, ErrorInterceptorHandler handler) {
        print(error.message);
        return handler.next(error);
      }, onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
        print('${options.method} | ${options.path}');
        return handler.next(options);
      }, onResponse: (Response response, ResponseInterceptorHandler handler) {
        print(
            '${response.statusCode} | ${response.statusMessage} | ${response.data}');
        return handler.next(response);
      }),
    );
  }

  @override
  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        headers: {'x-api-key': API_KEY},
      ),
    );
    initInterceptors();
  }
}
