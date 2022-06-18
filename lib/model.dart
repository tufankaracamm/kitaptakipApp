// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'dart:convert';

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
  Books({
    required this.status,
    required this.code,
    required this.total,
    required this.data,
  });

  String status;
  int code;
  int total;
  List<Datum> data;

  factory Books.fromJson(Map<String, dynamic> json) => Books(
    status: json["status"],
    code: json["code"],
    total: json["total"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "total": total,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.description,
    required this.isbn,
    required this.image,
    required this.published,
    required this.publisher,
  });

  int id;
  String title;
  String author;
  String genre;
  String description;
  String isbn;
  String image;
  DateTime published;
  String publisher;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    author: json["author"],
    genre: json["genre"],
    description: json["description"],
    isbn: json["isbn"],
    image: json["image"],
    published: DateTime.parse(json["published"]),
    publisher: json["publisher"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "author": author,
    "genre": genre,
    "description": description,
    "isbn": isbn,
    "image": image,
    "published": "${published.year.toString().padLeft(4, '0')}-${published.month.toString().padLeft(2, '0')}-${published.day.toString().padLeft(2, '0')}",
    "publisher": publisher,
  };
}
