import 'package:get/instance_manager.dart';
import 'package:getx_news/core/model/article.dart';
import 'package:getx_news/core/model/news_response.dart';
import 'package:getx_news/core/repository/news_repository.dart';
import 'package:getx_news/service/http_service.dart';
import 'package:get/get.dart';
import 'package:getx_news/service/http_service_impl.dart';

class NewsRepositoryImpl implements NewsRepository {
  late HttpService _httpService;

  NewsRepositoryImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Article>> getNewsHeadline() async {
    try {
      final response =
          await _httpService.getRequest('/v2/top-headlines?country=us');

      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<Article>> getSearchNews(String query) async {
    try {
      final response = await _httpService.getRequest('/v2/everything?q=$query');

      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }
}
