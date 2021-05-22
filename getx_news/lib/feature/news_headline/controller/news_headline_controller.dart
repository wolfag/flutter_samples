import 'package:get/get.dart';
import 'package:getx_news/core/model/article.dart';
import 'package:getx_news/core/repository/news_repository.dart';
import 'package:getx_news/core/repository/news_repository_impl.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepository _newsRepository;

  NewsHeadlineController() {
    _newsRepository = Get.find<NewsRepositoryImpl>();
    loadNewsHeadline();
  }

  RxList<Article> articles = RxList<Article>();
  RxBool isLoading = false.obs;

  loadNewsHeadline() async {
    showLoading();
    final result = await _newsRepository.getNewsHeadline();
    articles = result.obs;
    hideLoading();
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
