class NewsModel {
  List<Articles>? articels;

  NewsModel({this.articels});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articels = <Articles>[];
      json['articles'].forEach((v) {
        articels!.add(Articles.fromJson(v));
      });
    }
  }
}

class Articles {
  Source? source;
  String? author, title, description, url, urlToImage, publishedAt, content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json['source']);
    author = json['author'] ?? '';
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    url = json['url'] ?? '';
    urlToImage = json['urlToImage'] ??
        'https://www.ryanhart.org/img/featured_journal_empty.jpg';
    publishedAt = json['publishedAt'] ?? '';
    content = json['content'] ?? '';
  }

  /// this data from MAP file
  factory Articles.fromMap(Map<String, dynamic> json) {
    return Articles(
        source: Source.fromJson(json['source']),
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
