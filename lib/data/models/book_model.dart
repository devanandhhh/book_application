class BookModel {
  final String id;
  final String title;
  final String description;
  final DateTime publishedDate;
  final String authorId;
  final String coverPictureURL;
  final int price;
  final List<dynamic> ratings;
  final int starCount;

  BookModel({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedDate,
    required this.authorId,
    required this.coverPictureURL,
    required this.price,
    required this.ratings,
    required this.starCount,
  });

  // Convert JSON data to Book object
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id']??'',
      title: json['title']??'',
      description: json['description']??"",
      publishedDate: DateTime.parse(json['publishedDate']),
      authorId: json['authorId']??"",
      coverPictureURL: json['coverPictureURL']??"",
      price: json['price']??0,
      ratings: json['ratings'] ?? [], // Default to empty list if null
      starCount: json['starCount'] ?? 0, // Default to 0 if null
    );
  }

  // Convert Book object to JSON
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'description': description,
  //     'publishedDate': publishedDate.toIso8601String(),
  //     'authorId': authorId,
  //     'coverPictureURL': coverPictureURL,
  //     'price': price,
  //     'ratings': ratings,
  //     'starCount': starCount,
  //   };
  // }
}
