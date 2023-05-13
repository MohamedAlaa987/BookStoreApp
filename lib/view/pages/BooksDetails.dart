// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/model/Book_dec.dart';
import 'package:flutter_application_1/model/Books.dart';
import 'package:flutter_application_1/provider/bookprovider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import '../../helpers/app_helpers.dart';

class bookdetails extends StatefulWidget {
  Books book;
  bookdetails({required this.book, Key? key}) : super(key: key);

  @override
  State<bookdetails> createState() => _bookdetailsState();
}

class _bookdetailsState extends State<bookdetails> {
  var quantity = 1;
  List<String> mylist = [
    "subtitle",
    "authors",
    "publisher",
    "language",
    "isbn10",
    "isbn13",
    "pages",
    "year",
    "rating",
    "desc",
    "price",
    "image",
    "url",
  ];
  List mylist1 = [];

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<BookProvider>(context, listen: false)
        .getdecBooks(context, widget.book.isbn13 ?? '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            Provider.of<BookProvider>(context).decBooks?.title ?? 'No Title',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        body: Material(
          color: Colors.yellow.shade100,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              Provider.of<BookProvider>(context)
                                      .decBooks
                                      ?.image ??
                                  '',
                            ),
                            fit: BoxFit.contain))),
              ),
              SingleChildScrollView(
                controller: ScrollController(),
                child: Container(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Provider.of<BookProvider>(context)
                                      .decBooks
                                      ?.title ??
                                  'No Title',
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "imformation",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SingleChildScrollView(
                              child: Column(children: [
                                SingleChildScrollView(
                                  child: Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'subtitle',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Provider.of<BookProvider>(
                                                              context)
                                                          .decBooks
                                                          ?.subtitle ??
                                                      '',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            children: [
                                              Text(
                                                'authors',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            children: [
                                              Text(
                                                Provider.of<BookProvider>(
                                                            context)
                                                        .decBooks
                                                        ?.authors ??
                                                    '',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'publisher',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: Column(
                                            children: [
                                              Text(
                                                Provider.of<BookProvider>(
                                                            context)
                                                        .decBooks
                                                        ?.publisher ??
                                                    '',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'language',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: Column(
                                            children: [
                                              Text(
                                                Provider.of<BookProvider>(
                                                            context)
                                                        .decBooks
                                                        ?.language ??
                                                    '',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'isbn10',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: Column(
                                            children: [
                                              Text(
                                                Provider.of<BookProvider>(
                                                            context)
                                                        .decBooks
                                                        ?.isbn10 ??
                                                    '',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'isbn13',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              Provider.of<BookProvider>(context)
                                                      .decBooks
                                                      ?.isbn13 ??
                                                  '',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'pages',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              Provider.of<BookProvider>(context)
                                                      .decBooks
                                                      ?.pages ??
                                                  '',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'year',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              Provider.of<BookProvider>(context)
                                                      .decBooks
                                                      ?.year ??
                                                  '',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'rating',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              Provider.of<BookProvider>(context)
                                                      .decBooks
                                                      ?.rating ??
                                                  '',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SingleChildScrollView(
                                  child: Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'url',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          Flexible(
                                            child: Column(
                                              children: [
                                                Text(
                                                  softWrap: true,
                                                  maxLines: 20,
                                                  Provider.of<BookProvider>(
                                                              context)
                                                          .decBooks
                                                          ?.url ??
                                                      '',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            children: [
                                              Text(
                                                'dec',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            children: [
                                              Text(
                                                Provider.of<BookProvider>(
                                                            context)
                                                        .decBooks
                                                        ?.desc ??
                                                    '',
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                )
                              ]),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      Provider.of<BookProvider>(context)
                                                  .decBooks ==
                                              null
                                          ? ''
                                          : Provider.of<BookProvider>(context)
                                                  .decBooks!
                                                  .price ??
                                              '',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 23),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (quantity != 1) {
                                              setState(() {
                                                --quantity;
                                              });
                                            }
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            quantity.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              ++quantity;
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: InkWell(
                                      onTap: () {
                                        onItemClicked(
                                            Provider.of<BookProvider>(context,
                                                    listen: false)
                                                .decBooks!,
                                            quantity,
                                            context);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25, vertical: 15),
                                          child: Text(
                                            (Provider.of<BookProvider>(context)
                                                    .cartContainsBook(
                                                        Provider.of<BookProvider>(
                                                                        context)
                                                                    .decBooks ==
                                                                null
                                                            ? ''
                                                            : Provider.of<BookProvider>(
                                                                        context)
                                                                    .decBooks!
                                                                    .title ??
                                                                ''))
                                                ? '- remove From Cart'
                                                : '+ Add To Cart',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            )
                          ])),
                ),
              )
            ]),
          ),
        ));
  }

  void onItemClicked(Bookdec book, int quantity, BuildContext context) {
    var result = book.price?.substring(1);
    var price = double.parse(result ?? '');

    if (book.price != '\$0.00') {
      if (Provider.of<BookProvider>(context, listen: false)
          .cartContainsBook(book.title ?? '')) {
        Provider.of<BookProvider>(context, listen: false)
            .removeBookFromCart(book.title ?? '');

        AppHelper.showDialogEx(context, 'Item Deleted');
      } else {
        Provider.of<BookProvider>(context, listen: false).addBookToCart({
          'quantity': quantity,
          'title': book.title,
          'price': price,
          'image': book.image,
        });

        AppHelper.showDialogEx(context, 'Item Added Suuccessfuly');

        setState(() {
          quantity = 1;
        });
      }
    } else {
      AppHelper.showDialogEx(context, 'Item Have No Price and can not Added');
    }
  }
}
