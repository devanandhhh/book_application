// BOOK MODEL ---
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

  // Convert JSON data to BookModel object
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id']??'',
      title: json['title']??'',
      description: json['description']??"",
      publishedDate: DateTime.parse(json['publishedDate']),
      authorId: json['authorId']??"",
      coverPictureURL: json['coverPictureURL']??"",
      price: json['price']??0,
      ratings: json['ratings'] ?? [], 
      starCount: json['starCount'] ?? 0, 
    );
  }


}
