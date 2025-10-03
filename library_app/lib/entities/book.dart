class Book {
  final String id;
  final String title;
  final String author;
  final String gender;
  final int amount;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.gender,
    required this.amount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json["_id"] ?? "",
      title: json["titulo"] ?? "",
      author: json["autor"] ?? "",
      gender: json["genero"] ?? "",
      amount: json["quantidade"] ?? 0,
    );
  }
}
