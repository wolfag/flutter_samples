import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news/core/model/article.dart';
import 'package:getx_news/core/repository/news_repository.dart';
import 'package:getx_news/core/repository/news_repository_impl.dart';

class SearchNewsController extends GetxController {
  late NewsRepository _newsRepository;
  final searchTextController = TextEditingController();

  SearchNewsController() {
    _newsRepository = Get.find<NewsRepositoryImpl>();
    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.length != 0) {
        searchNewsHeadline();
      }
    });
  }

  RxList<Article> articles = RxList<Article>();
  RxBool isLoading = false.obs;

  searchNewsHeadline() async {
    showLoading();
    final result =
        await _newsRepository.getSearchNews(searchTextController.text);
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
