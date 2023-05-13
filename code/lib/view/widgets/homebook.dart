import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Books.dart';
import 'package:flutter_application_1/model/book_home.dart';
import 'package:flutter_application_1/provider/bookprovider.dart';
import 'package:flutter_application_1/view/pages/BooksDetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class bookwidget extends StatelessWidget {
  final Books book;
  const bookwidget({required this.book, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => bookdetails(
                        book: book,
                      )));
        },
        child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 3,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 200,
                width: 150,
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(book.image ?? ''),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        book.title ?? '',
                        maxLines: 2,
                        style: GoogleFonts.notoSans(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      book.price == '\$0.00'
                          ? Text(
                              "Free",
                              style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            )
                          : Text(
                              "${book.price}",
                              style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                    ])))));
  }
}
