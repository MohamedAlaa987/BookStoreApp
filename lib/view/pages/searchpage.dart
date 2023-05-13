import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/provider/bookprovider.dart';
import 'package:flutter_application_1/services/app_service.dart';
import 'package:flutter_application_1/view/pages/categroy_page.dart';
import 'package:flutter_application_1/view/pages/home_page.dart';
import 'package:flutter_application_1/view/widgets/homebook.dart';
import 'package:flutter_application_1/view/widgets/screenTamplate.dart';
import 'package:flutter_application_1/view/widgets/screentemplate1.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return ScreenTemplate1(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Flexible(
    //               child: TextField(
    //                   controller: mycontroller,
    //                   decoration: InputDecoration(
    //                     labelText: "search",
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(20)),
    //                     prefixIcon: Icon(Icons.search),
    //                   )),
    //             ),
    //             SizedBox(
    //               width: 80,
    //               height: 40,
    //               child: ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                     primary: Colors.yellow.shade200,
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(15))),
    //                 onPressed: () {
    //                   Provider.of<BookProvider>(context, listen: false)
    //                       .getanyBook(context, mycontroller.text);
    //                 },
    //                 child: Text('Search'),
    //               ),
    //             )
    //           ],
    //         ),
    //         Provider.of<BookProvider>(context).anyBooks == null
    //             ? SizedBox()
    //             : Provider.of<BookProvider>(context).anyBooks?.isEmpty ?? false
    //                 ? Center(
    //                     child: Text('No Data'),
    //                   )
    //                 : Wrap(
    //                     spacing: 10,
    //                     runSpacing: 10,
    //                     children: Provider.of<BookProvider>(context)
    //                         .anyBooks!
    //                         .map((e) => bookwidget(book: e))
    //                         .toList()),
    //       ],
    //     ),
    //   ),
    //   index: 1,
    // );
    return MediaQuery.of(context).size.width > 500 ? webview() : mobileview();
  }

  Widget mobileview() {
    return SafeArea(
      child: ScreenTemplate1(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                          controller: mycontroller,
                          decoration: InputDecoration(
                            labelText: "search",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(Icons.search),
                          )),
                    ),
                    SizedBox(
                      width: 80,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          Provider.of<BookProvider>(context, listen: false)
                              .getanyBook(context, mycontroller.text);
                        },
                        child: Text('Search'),
                      ),
                    )
                  ],
                ),
              ),
              Provider.of<BookProvider>(context).anyBooks == null
                  ? SizedBox()
                  : Provider.of<BookProvider>(context).anyBooks?.isEmpty ??
                          false
                      ? Center(
                          child: Text('No Data'),
                        )
                      : Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: Provider.of<BookProvider>(context)
                              .anyBooks!
                              .map((e) => bookwidget(book: e))
                              .toList()),
            ],
          ),
        ),
        index: 1,
      ),
    );
  }

  Widget webview() {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 250,
              child: Column(children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    AppService.user?.name.toString() ?? '',
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text(
                    AppService.user?.email ?? '',
                    style: TextStyle(color: Colors.black),
                  ),
                  currentAccountPicture: CircleAvatar(
                    child: Text(
                      AppService.user?.name.toString()[0] ?? '',
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
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextField(
                            controller: mycontroller,
                            decoration: InputDecoration(
                              labelText: "search",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              prefixIcon: Icon(Icons.search),
                            )),
                      ),
                      SizedBox(
                        width: 80,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.yellow.shade200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            Provider.of<BookProvider>(context, listen: false)
                                .getanyBook(context, mycontroller.text);
                          },
                          child: Text('Search'),
                        ),
                      )
                    ],
                  ),
                  Provider.of<BookProvider>(context).anyBooks == null
                      ? SizedBox()
                      : Provider.of<BookProvider>(context).anyBooks?.isEmpty ??
                              false
                          ? Center(
                              child: Text('No Data'),
                            )
                          : Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: Provider.of<BookProvider>(context)
                                  .anyBooks!
                                  .map((e) => bookwidget(book: e))
                                  .toList()),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // return ScreenTemplate1(
  //   body: SingleChildScrollView(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Flexible(
  //               child: TextField(
  //                   controller: mycontroller,
  //                   decoration: InputDecoration(
  //                     labelText: "search",
  //                     border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(20)),
  //                     prefixIcon: Icon(Icons.search),
  //                   )),
  //             ),
  //             SizedBox(
  //               width: 80,
  //               height: 40,
  //               child: ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                     primary: Colors.yellow.shade200,
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(15))),
  //                 onPressed: () {
  //                   Provider.of<BookProvider>(context, listen: false)
  //                       .getanyBook(context, mycontroller.text);
  //                 },
  //                 child: Text('Search'),
  //               ),
  //             )
  //           ],
  //         ),
  //         Provider.of<BookProvider>(context).anyBooks == null
  //             ? SizedBox()
  //             : Provider.of<BookProvider>(context).anyBooks?.isEmpty ?? false
  //                 ? Center(
  //                     child: Text('No Data'),
  //                   )
  //                 : Wrap(
  //                     spacing: 10,
  //                     runSpacing: 10,
  //                     children: Provider.of<BookProvider>(context)
  //                         .anyBooks!
  //                         .map((e) => bookwidget(book: e))
  //                         .toList()),
  //       ],
  //     ),
  //   ),
  //   index: 1,
  // );
}
