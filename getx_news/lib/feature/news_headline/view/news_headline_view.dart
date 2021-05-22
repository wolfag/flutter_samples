import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news/core/widget/drawer.dart';
import 'package:getx_news/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends GetWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('News Headline'),
      ),
      drawer: getAppDrawer(),
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return Center(
            child: CircularProgressIndicator(),
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
    );
  }
}
