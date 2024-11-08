// AUTHOR MODEL ----

class AuthorModel {
  final String id;
  final String name;
  final DateTime birthdate;
  final String biography;

  AuthorModel({
    required this.id,
    required this.name,
    required this.birthdate,
    required this.biography,
  });

  // Factory constructor to create an instance from JSON
  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
      biography: json['biography'] as String,
    );
  }
}
