import 'package:json_annotation/json_annotation.dart';

import 'package:getx_news/core/model/article.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'totalResults')
  int totalResults;

  @JsonKey(name: 'articles')
  List<Article> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
