class NewsModel {
  final int id;
  final String title;
  final String text;
  final String summary;
  final String url;
  final String image;
  final String publishDate;
  final String author;
  final String category;

  NewsModel({
    required this.id,
    required this.title,
    required this.text,
    required this.summary,
    required this.url,
    required this.image,
    required this.publishDate,
    required this.author,
    required this.category,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      text: json['text'],
      summary: json['summary'],
      url: json['url'],
      image:
          json['image'] != null && json['image'].toString().startsWith('http')
              ? json['image']
              : '',
      publishDate: json['publish_date'],
      author: json['author'],
      category: json['category'],
    );
  }
}
