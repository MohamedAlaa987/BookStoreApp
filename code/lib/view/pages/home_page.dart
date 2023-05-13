import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/helpers/app_helpers.dart';
import 'package:flutter_application_1/provider/bookprovider.dart';
import 'package:flutter_application_1/services/app_service.dart';
import 'package:flutter_application_1/view/pages/allBooks_page.dart';
import 'package:flutter_application_1/view/pages/allnewBookPage.dart';
import 'package:flutter_application_1/view/pages/categroy_page.dart';
import 'package:flutter_application_1/view/pages/checkout_page.dart';
import 'package:flutter_application_1/view/pages/searchpage.dart';
import 'package:flutter_application_1/view/pages/splash_page.dart';
import 'package:flutter_application_1/view/widgets/booksilder.dart';
import 'package:flutter_application_1/view/widgets/homebook.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/view/widgets/screenTamplate.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPos = 0;
  List<String> listbookslider = [
    "assets/0.png",
    "assets/1.png",
    "assets/2.png",
    "assets/3.png",
    "assets/4.png",
    "assets/5.png",
  ];
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<BookProvider>(context, listen: false).getHomePageBooks(context);
    Provider.of<BookProvider>(context, listen: false)
        .getHomePagenewBooks(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return //ScreenTemplate(
        //   appBar: AppBar(
        //     backgroundColor: Color.fromARGB(202, 255, 255, 0),
        //     title: Text(
        //       'BookStore',
        //       style: TextStyle(fontSize: 14, color: Colors.black),
        //     ),
        //     actions: [
        //       Provider.of<BookProvider>(context).BooksSelected != null
        //           ? Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Badge(
        //                 position: BadgePosition.topStart(),
        //                 badgeContent: Text(
        //                   Provider.of<BookProvider>(context)
        //                       .BooksSelected!
        //                       .length
        //                       .toString(),
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //                 child: IconButton(
        //                     onPressed: () {
        //                       Navigator.push(
        //                           context,
        //                           MaterialPageRoute(
        //                               builder: (_) => checkout(
        //                                   bookSelected: Provider.of<BookProvider>(
        //                                           context,
        //                                           listen: false)
        //                                       .BooksSelected)));
        //                     },
        //                     icon: Icon(Icons.shopping_cart)),
        //               ),
        //             )
        //           : Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: IconButton(
        //                   onPressed: () {
        //                     AppHelper.showDialogEx(
        //                         context, 'Please Pick Items First');
        //                   },
        //                   icon: Icon(Icons.shopping_cart))),
        //       IconButton(
        //           onPressed: () async {
        //             var success = await showFutureLoadingDialog(
        //                 context: context,
        //                 future: () =>
        //                     Future.delayed(Duration(seconds: 2), () async {
        //                       var result = await AppService.prefs?.clear();

        //                       return result;
        //                     }));

        //             if (success.result ?? false) {
        //               Navigator.pushAndRemoveUntil(
        //                   context,
        //                   MaterialPageRoute(builder: (_) => SplashPage()),
        //                   (route) => false);
        //             } else {
        //               AppHelper.showDialogEx(context, 'Error In LogOut');
        //             }
        //           },
        //           icon: Icon(Icons.logout))
        //     ],
        //   ),
        //   body: SingleChildScrollView(
        //     child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               CarouselSlider.builder(
        //                   itemCount: listbookslider.length,
        //                   options: CarouselOptions(
        //                       autoPlay: true,
        //                       onPageChanged: (index, reason) {
        //                         setState(() {
        //                           currentPos = index;
        //                         });
        //                       }),
        //                   itemBuilder: ((context, index, realIndex) {
        //                     return Bookslider(context, listbookslider[index]);
        //                   })),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: listbookslider.map((url) {
        //                   int index = listbookslider.indexOf(url);
        //                   return Container(
        //                     width: 8.0,
        //                     height: 8.0,
        //                     margin: EdgeInsets.symmetric(
        //                         vertical: 10.0, horizontal: 2.0),
        //                     decoration: BoxDecoration(
        //                       shape: BoxShape.circle,
        //                       color: currentPos == index
        //                           ? Color.fromRGBO(0, 0, 0, 0.9)
        //                           : Color.fromRGBO(0, 0, 0, 0.4),
        //                     ),
        //                   );
        //                 }).toList(),
        //               ),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(
        //                     "Books",
        //                     style: TextStyle(
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 16),
        //                   ),
        //                   TextButton(
        //                       onPressed: () {
        //                         Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (_) => AllBooksPage(
        //                                       categoryTitle: null,
        //                                     )));
        //                       },
        //                       child: Text(
        //                         "SeeMore",
        //                         style: TextStyle(
        //                             color: Colors.black,
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: 16),
        //                       )),
        //                 ],
        //               ),
        //               Provider.of<BookProvider>(context).homeBooks == null
        //                   ? Center(
        //                       child: CircularProgressIndicator(),
        //                     )
        //                   : Provider.of<BookProvider>(context).homeBooks?.isEmpty ??
        //                           false
        //                       ? Center(
        //                           child: Text('No Data'),
        //                         )
        //                       : Wrap(
        //                           spacing: 10,
        //                           runSpacing: 10,
        //                           children: Provider.of<BookProvider>(context)
        //                               .homeBooks!
        //                               .getRange(0, 3)
        //                               .map((e) => bookwidget(book: e))
        //                               .toList(),
        //                         ),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(
        //                     "NewBooks",
        //                     style: TextStyle(
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 16),
        //                   ),
        //                   TextButton(
        //                       onPressed: () {
        //                         Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (_) => AllNewBooksPage()));
        //                       },
        //                       child: Text(
        //                         "SeeMore",
        //                         style: TextStyle(
        //                             color: Colors.black,
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: 16),
        //                       )),
        //                 ],
        //               ),
        //               Provider.of<BookProvider>(context).newBooks == null
        //                   ? Center(
        //                       child: CircularProgressIndicator(),
        //                     )
        //                   : Provider.of<BookProvider>(context).newBooks?.isEmpty ??
        //                           false
        //                       ? Center(
        //                           child: Text('No Data'),
        //                         )
        //                       : Wrap(
        //                           spacing: 10,
        //                           runSpacing: 10,
        //                           children: Provider.of<BookProvider>(context)
        //                               .newBooks!
        //                               .getRange(0, 3)
        //                               .map((e) => bookwidget(book: e))
        //                               .toList(),
        //                         ),
        //             ])),
        //   ),
        //   index: 0,
        // );
        MediaQuery.of(context).size.width > 500 ? webview() : mobileview();
  }

  Widget mobileview() {
    return ScreenTemplate(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(202, 255, 255, 0),
        title: Text(
          'BookStore',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        actions: [
          Provider.of<BookProvider>(context).BooksSelected != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Badge(
                    position: BadgePosition.topStart(),
                    badgeContent: Text(
                      Provider.of<BookProvider>(context)
                          .BooksSelected!
                          .length
                          .toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => checkout(
                                      bookSelected: Provider.of<BookProvider>(
                                              context,
                                              listen: false)
                                          .BooksSelected)));
                        },
                        icon: Icon(Icons.shopping_cart)),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        AppHelper.showDialogEx(
                            context, 'Please Pick Items First');
                      },
                      icon: Icon(Icons.shopping_cart))),
          IconButton(
              onPressed: () async {
                var success = await showFutureLoadingDialog(
                    context: context,
                    future: () =>
                        Future.delayed(Duration(seconds: 2), () async {
                          var result = await AppService.prefs?.clear();

                          return result;
                        }));

                if (success.result ?? false) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => SplashPage()),
                      (route) => false);
                } else {
                  AppHelper.showDialogEx(context, 'Error In LogOut');
                }
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                      itemCount: listbookslider.length,
                      options: CarouselOptions(
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentPos = index;
                            });
                          }),
                      itemBuilder: ((context, index, realIndex) {
                        return Bookslider(context, listbookslider[index]);
                      })),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: listbookslider.map((url) {
                      int index = listbookslider.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPos == index
                              ? Color.fromRGBO(0, 0, 0, 0.9)
                              : Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Books",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AllBooksPage(
                                          categoryTitle: null,
                                        )));
                          },
                          child: Text(
                            "SeeMore",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  ),
                  Provider.of<BookProvider>(context).homeBooks == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Provider.of<BookProvider>(context).homeBooks?.isEmpty ??
                              false
                          ? Center(
                              child: Text('No Data'),
                            )
                          : Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: Provider.of<BookProvider>(context)
                                  .homeBooks!
                                  .getRange(0, 3)
                                  .map((e) => bookwidget(book: e))
                                  .toList(),
                            ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "NewBooks",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AllNewBooksPage()));
                          },
                          child: Text(
                            "SeeMore",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  ),
                  Provider.of<BookProvider>(context).newBooks == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Provider.of<BookProvider>(context).newBooks?.isEmpty ??
                              false
                          ? Center(
                              child: Text('No Data'),
                            )
                          : Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: Provider.of<BookProvider>(context)
                                  .newBooks!
                                  .getRange(0, 3)
                                  .map((e) => bookwidget(book: e))
                                  .toList(),
                            ),
                ])),
      ),
      index: 0,
    );
  }

  Widget webview() {
    var firstname = AppService.user?.name?.firstname ?? '';
    var lastname = AppService.user?.name!.lastname ?? '';
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              width: 250,
              child: Column(children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    firstname + ' ' + lastname,
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text(
                    AppService.user?.email ?? '',
                    style: TextStyle(color: Colors.black),
                  ),
                  currentAccountPicture: CircleAvatar(
                    child: Text(
                      firstname[0],
                      style: TextStyle(color: Colors.black),
                    ),
                    radius: 30,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                        (route) => false);
                  },
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("home"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => SearchPage()),
                        (route) => false);
                  },
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: Text("search"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => cateroyPage()),
                        (route) => false);
                  },
                  child: ListTile(
                    leading: Icon(Icons.category),
                    title: Text("categroy"),
                  ),
                ),
              ]),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('BookStore',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Row(children: [
                          Provider.of<BookProvider>(context).BooksSelected !=
                                  null
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Badge(
                                    position: BadgePosition.topStart(),
                                    badgeContent: Text(
                                      Provider.of<BookProvider>(context)
                                          .BooksSelected!
                                          .length
                                          .toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => checkout(
                                                      bookSelected: Provider.of<
                                                                  BookProvider>(
                                                              context,
                                                              listen: false)
                                                          .BooksSelected)));
                                        },
                                        icon: Icon(Icons.shopping_cart)),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                      onPressed: () {
                                        AppHelper.showDialogEx(
                                            context, 'Please Pick Items First');
                                      },
                                      icon: Icon(Icons.shopping_cart))),
                          IconButton(
                              onPressed: () async {
                                var success = await showFutureLoadingDialog(
                                    context: context,
                                    future: () => Future.delayed(
                                            Duration(seconds: 2), () async {
                                          var result =
                                              await AppService.prefs?.clear();

                                          return result;
                                        }));

                                if (success.result ?? false) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SplashPage()),
                                      (route) => false);
                                } else {
                                  AppHelper.showDialogEx(
                                      context, 'Error In LogOut');
                                }
                              },
                              icon: Icon(Icons.logout))
                        ]),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(
                              itemCount: listbookslider.length,
                              options: CarouselOptions(
                                  autoPlay: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentPos = index;
                                    });
                                  }),
                              itemBuilder: ((context, index, realIndex) {
                                return Bookslider(
                                    context, listbookslider[index]);
                              })),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: listbookslider.map((url) {
                              int index = listbookslider.indexOf(url);
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentPos == index
                                      ? Color.fromRGBO(0, 0, 0, 0.9)
                                      : Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              );
                            }).toList(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Books",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => AllBooksPage(
                                                  categoryTitle: null,
                                                )));
                                  },
                                  child: Text(
                                    "SeeMore",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )),
                            ],
                          ),
                          Provider.of<BookProvider>(context).homeBooks == null
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Provider.of<BookProvider>(context)
                                          .homeBooks
                                          ?.isEmpty ??
                                      false
                                  ? Center(
                                      child: Text('No Data'),
                                    )
                                  : Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children:
                                          Provider.of<BookProvider>(context)
                                              .homeBooks!
                                              .getRange(0, 3)
                                              .map((e) => bookwidget(book: e))
                                              .toList(),
                                    ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "NewBooks",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => AllNewBooksPage()));
                                  },
                                  child: Text(
                                    "SeeMore",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )),
                            ],
                          ),
                          Provider.of<BookProvider>(context).newBooks == null
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Provider.of<BookProvider>(context)
                                          .newBooks
                                          ?.isEmpty ??
                                      false
                                  ? Center(
                                      child: Text('No Data'),
                                    )
                                  : Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children:
                                          Provider.of<BookProvider>(context)
                                              .newBooks!
                                              .getRange(0, 3)
                                              .map((e) => bookwidget(book: e))
                                              .toList(),
                                    ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    //   appBar: AppBar(
    //     backgroundColor: Color.fromARGB(202, 255, 255, 0),
    //     title: Text(
    //       'BookStore',
    //       style: TextStyle(fontSize: 14, color: Colors.black),
    //     ),
    //     actions: [
    //       Provider.of<BookProvider>(context).BooksSelected != null
    //           ? Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Badge(
    //                 position: BadgePosition.topStart(),
    //                 badgeContent: Text(
    //                   Provider.of<BookProvider>(context)
    //                       .BooksSelected!
    //                       .length
    //                       .toString(),
    //                   style: TextStyle(color: Colors.white),
    //                 ),
    //                 child: IconButton(
    //                     onPressed: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (_) => checkout(
    //                                   bookSelected: Provider.of<BookProvider>(
    //                                           context,
    //                                           listen: false)
    //                                       .BooksSelected)));
    //                     },
    //                     icon: Icon(Icons.shopping_cart)),
    //               ),
    //             )
    //           : Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: IconButton(
    //                   onPressed: () {
    //                     AppHelper.showDialogEx(
    //                         context, 'Please Pick Items First');
    //                   },
    //                   icon: Icon(Icons.shopping_cart))),
    //       IconButton(
    //           onPressed: () async {
    //             var success = await showFutureLoadingDialog(
    //                 context: context,
    //                 future: () =>
    //                     Future.delayed(Duration(seconds: 2), () async {
    //                       var result = await AppService.prefs?.clear();

    //                       return result;
    //                     }));

    //             if (success.result ?? false) {
    //               Navigator.pushAndRemoveUntil(
    //                   context,
    //                   MaterialPageRoute(builder: (_) => SplashPage()),
    //                   (route) => false);
    //             } else {
    //               AppHelper.showDialogEx(context, 'Error In LogOut');
    //             }
    //           },
    //           icon: Icon(Icons.logout))
    //     ],
    //   ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               CarouselSlider.builder(
    //                   itemCount: listbookslider.length,
    //                   options: CarouselOptions(
    //                       autoPlay: true,
    //                       onPageChanged: (index, reason) {
    //                         setState(() {
    //                           currentPos = index;
    //                         });
    //                       }),
    //                   itemBuilder: ((context, index, realIndex) {
    //                     return Bookslider(context, listbookslider[index]);
    //                   })),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: listbookslider.map((url) {
    //                   int index = listbookslider.indexOf(url);
    //                   return Container(
    //                     width: 8.0,
    //                     height: 8.0,
    //                     margin: EdgeInsets.symmetric(
    //                         vertical: 10.0, horizontal: 2.0),
    //                     decoration: BoxDecoration(
    //                       shape: BoxShape.circle,
    //                       color: currentPos == index
    //                           ? Color.fromRGBO(0, 0, 0, 0.9)
    //                           : Color.fromRGBO(0, 0, 0, 0.4),
    //                     ),
    //                   );
    //                 }).toList(),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     "Books",
    //                     style: TextStyle(
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 16),
    //                   ),
    //                   TextButton(
    //                       onPressed: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (_) => AllBooksPage(
    //                                       categoryTitle: null,
    //                                     )));
    //                       },
    //                       child: Text(
    //                         "SeeMore",
    //                         style: TextStyle(
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: 16),
    //                       )),
    //                 ],
    //               ),
    //               Provider.of<BookProvider>(context).homeBooks == null
    //                   ? Center(
    //                       child: CircularProgressIndicator(),
    //                     )
    //                   : Provider.of<BookProvider>(context).homeBooks?.isEmpty ??
    //                           false
    //                       ? Center(
    //                           child: Text('No Data'),
    //                         )
    //                       : Wrap(
    //                           spacing: 10,
    //                           runSpacing: 10,
    //                           children: Provider.of<BookProvider>(context)
    //                               .homeBooks!
    //                               .getRange(0, 3)
    //                               .map((e) => bookwidget(book: e))
    //                               .toList(),
    //                         ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     "NewBooks",
    //                     style: TextStyle(
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 16),
    //                   ),
    //                   TextButton(
    //                       onPressed: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (_) => AllNewBooksPage()));
    //                       },
    //                       child: Text(
    //                         "SeeMore",
    //                         style: TextStyle(
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: 16),
    //                       )),
    //                 ],
    //               ),
    //               Provider.of<BookProvider>(context).newBooks == null
    //                   ? Center(
    //                       child: CircularProgressIndicator(),
    //                     )
    //                   : Provider.of<BookProvider>(context).newBooks?.isEmpty ??
    //                           false
    //                       ? Center(
    //                           child: Text('No Data'),
    //                         )
    //                       : Wrap(
    //                           spacing: 10,
    //                           runSpacing: 10,
    //                           children: Provider.of<BookProvider>(context)
    //                               .newBooks!
    //                               .getRange(0, 3)
    //                               .map((e) => bookwidget(book: e))
    //                               .toList(),
    //                         ),
    //             ])),
    //   ),
    //   index: 0,
    // );
  }
}
