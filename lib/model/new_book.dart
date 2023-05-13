import 'package:flutter_application_1/model/Books.dart';

class BookNew {
  String? error;
  String? total;
  List<Books>? books;

  BookNew();

  BookNew.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    total = json['total'];
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = error;
    data['total'] = total;
    if (books != null) {
      data['books'] = books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
