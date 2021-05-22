import 'package:get/get.dart';
import 'package:getx_news/core/repository/news_repository_impl.dart';
import 'package:getx_news/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepositoryImpl());
    Get.put(NewsHeadlineController());
  }
}
