import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/app_helpers.dart';
import 'package:flutter_application_1/model/Book_dec.dart';
import 'package:flutter_application_1/model/Books.dart';

import 'package:flutter_application_1/model/book_home.dart';
import 'package:flutter_application_1/model/new_book.dart';
import 'package:flutter_application_1/view/pages/checkout_page.dart';
import 'package:flutter_application_1/view/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class BookProvider extends ChangeNotifier {
  List<Books>? _homeBooks;
  List<Books>? get homeBooks => _homeBooks;
  List<Books>? _newBooks;
  List<Books>? get newBooks => _newBooks;
  List<Books>? _anyBooks;
  List<Books>? get anyBooks => _anyBooks;

  List<Books>? _categoryBooks;
  List<Books>? get categoryBooks => _categoryBooks;
  List<Books>? _allBooks;
  List<Books>? get allBooks => _allBooks;
  Bookdec? _decBooks;
  Bookdec? get decBooks => _decBooks;
  List<Map<String, dynamic>>? _BooksSelected;
  List<Map<String, dynamic>>? get BooksSelected => _BooksSelected;
  void getHomePageBooks(BuildContext context) async {
    try {
      var response = await http
          .get(Uri.parse('https://api.itbook.store/1.0/search/books'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        var mylist = BookHome.fromJson(jsonDecode(response.body));
        _homeBooks = mylist.books;

        if (_homeBooks?.isEmpty ?? false) {
          _homeBooks = [];
        }
        notifyListeners();
      } else {
        _homeBooks = [];
        notifyListeners();
      }
    } catch (e) {
      AppHelper.showDialogEx(context, 'failed to get data');
      _homeBooks = [];
      notifyListeners();
    }
  }

  void getHomePagenewBooks(BuildContext context) async {
    try {
      var response = await http
          .get(Uri.parse('https://api.itbook.store/1.0/new'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        var mylist = BookNew.fromJson(jsonDecode(response.body));
        _newBooks = mylist.books;

        if (_homeBooks?.isEmpty ?? false) {
          _newBooks = [];
        }
        notifyListeners();
      } else {
        _newBooks = [];
        notifyListeners();
      }
    } catch (e) {
      AppHelper.showDialogEx(context, 'failed to get data');
      _newBooks = [];
      notifyListeners();
    }
  }

  void getanyBook(BuildContext context, String title) async {
    try {
      var response = await http
          .get(Uri.parse('https://api.itbook.store/1.0/search/${title}'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        var mylist = BookNew.fromJson(jsonDecode(response.body));
        _anyBooks = mylist.books;

        if (_homeBooks?.isEmpty ?? false) {
          _anyBooks = [];
        }
        notifyListeners();
      } else {
        _anyBooks = [];
        notifyListeners();
      }
    } catch (e) {
      AppHelper.showDialogEx(context, 'failed to get data');
      _newBooks = [];
      notifyListeners();
    }
  }

  void getCategoryBooks(BuildContext context, {required String title}) async {
    try {
      _categoryBooks = null;
      var response = await http
          .get(Uri.parse('https://api.itbook.store/1.0/search/${title}'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        var mylist = BookNew.fromJson(jsonDecode(response.body));
        _categoryBooks = mylist.books;

        if (_categoryBooks?.isEmpty ?? false) {
          _categoryBooks = [];
        }
        notifyListeners();
      } else {
        _categoryBooks = [];
        notifyListeners();
      }
    } catch (e) {
      AppHelper.showDialogEx(context, 'Exception : ${e}');
      _categoryBooks = [];
      notifyListeners();
    }
  }

  void getAllBooks(BuildContext context) async {
    try {
      _allBooks = null;
      var response = await http
          .get(Uri.parse('https://api.itbook.store/1.0/search/books'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        var mylist = BookNew.fromJson(jsonDecode(response.body));
        _allBooks = mylist.books;

        if (_allBooks?.isEmpty ?? false) {
          _allBooks = [];
        }
        notifyListeners();
      } else {
        _allBooks = [];
        notifyListeners();
      }
    } catch (e) {
      AppHelper.showDialogEx(context, 'Exception : ${e}');
      _allBooks = [];
      notifyListeners();
    }
  }

  void getdecBooks(BuildContext context, String isbn) async {
    try {
      var response = await http
          .get(Uri.parse('https://api.itbook.store/1.0/books/${isbn}'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        _decBooks = Bookdec.fromJson(jsonDecode(response.body));
        print(_decBooks);
        notifyListeners();
      } else {
        _decBooks = null;
        notifyListeners();
      }
    } catch (e) {
      AppHelper.showDialogEx(context, 'Exception : ${e}');
      _decBooks = null;
      notifyListeners();
    }
  }

  void addBookToCart(Map<String, dynamic> BookSelected) {
    _BooksSelected ??= [];
    _BooksSelected?.add(BookSelected);
    notifyListeners();
  }

  void removeBookFromCart(String title) {
    _BooksSelected?.removeWhere((element) => element['title'] == title);
  }

  String getCartTotalPrice() {
    double total = 0;

    for (var Book in _BooksSelected!) {
      total += Book['price'] * Book['quantity'];
    }

    return total.toString();
  }

  bool cartContainsBook(String title) {
    var result =
        _BooksSelected?.where((element) => element['title'] == title).toList();

    if (result?.isNotEmpty ?? false) {
      return true;
    } else {
      return false;
    }
  }

  void checkout(BuildContext context) async {
    notifyListeners();
    await AppHelper.showDialogEx(context, 'Suuccessfully check out');
    _BooksSelected = null;
    notifyListeners();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
  }
}
