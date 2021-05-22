import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news/core/widget/drawer.dart';
import 'package:getx_news/feature/search_news/controller/search_news_controller.dart';

class SearchNewsView extends GetWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Search News'),
      ),
      drawer: getAppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller.searchTextController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.isTrue) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.articles.isEmpty) {
                return Center(
                  child: Text('Empty'),
                );
              } else {
                return Container(
                  margin: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: controller.articles.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.articles[index].imageUrl != null)
                            Image.network(
                              controller.articles[index].imageUrl!,
                            )
                          else
                            Container(),
                          Text(
                            controller.articles[index].title!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(controller.articles[index].description!),
                        ],
                      );
                    },
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
