import 'package:news/domain/model/News.dart';

import 'SourceDTO.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "https://www.facebook.com/bbcnews"
/// title : "Christmas Eve pub shooting: Murder arrest over death of Elle Edwards"
/// description : "A man is held over the death of Elle Edwards, who was shot outside a pub in Wallasey on Christmas Eve."
/// url : "https://www.bbc.co.uk/news/uk-england-merseyside-64242118"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/0E58/production/_128127630_elleedwards-nc.jpg"
/// publishedAt : "2023-01-11T16:44:16Z"
/// content : "A man has been arrested on suspicion of murder over the fatal shooting of a woman at a pub on Christmas Eve.\r\nElle Edwards, 26, was shot outside outside The Lighthouse in Wallasey, Wirral, shortly be… [+1081 chars]"

class NewsDTO {
  SourceDTO? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsDTO({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  NewsDTO.fromJson(dynamic json) {
    source = json['source'] != null ? SourceDTO.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

  News toDomainNews() {
    return News(
      source: source?.toDomainSource(),
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }
}
