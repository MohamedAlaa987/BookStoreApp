import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/provider/bookprovider.dart';
import 'package:flutter_application_1/services/app_service.dart';
import 'package:flutter_application_1/view/pages/allBooks_page.dart';
import 'package:flutter_application_1/view/pages/home_page.dart';
import 'package:flutter_application_1/view/pages/searchpage.dart';
import 'package:flutter_application_1/view/widgets/categroy.dart';
import 'package:flutter_application_1/view/widgets/screentemplate1.dart';
import 'package:provider/provider.dart';

class cateroyPage extends StatefulWidget {
  const cateroyPage({Key? key}) : super(key: key);

  @override
  State<cateroyPage> createState() => _cateroyPageState();
}

class _cateroyPageState extends State<cateroyPage> {
  @override
  @override
  Widget build(BuildContext context) {
    //   return ScreenTemplate1(
    //       body: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             Card(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: AppService.categories == null
    //                     ? const Center(
    //                         child: CircularProgressIndicator(),
    //                       )
    //                     : AppService.categories?.isEmpty ?? false
    //                         ? const Center(
    //                             child: Text('No Data'),
    //                           )
    //                         : SingleChildScrollView(
    //                             child: ListView.builder(
    //                                 shrinkWrap: true,
    //                                 itemCount: AppService.categories?.length,
    //                                 itemBuilder: (context, index) {
    //                                   return Padding(
    //                                     padding: const EdgeInsets.all(5.0),
    //                                     child: CategoryWidget(
    //                                       index: index,
    //                                       onClicked: () {
    //                                         Navigator.push(
    //                                             context,
    //                                             MaterialPageRoute(
    //                                                 builder: (_) => AllBooksPage(
    //                                                       categoryTitle:
    //                                                           AppService
    //                                                               .categories!
    //                                                               .elementAt(
    //                                                                   index),
    //                                                     )));
    //                                       },
    //                                     ),
    //                                   );
    //                                 }),
    //                           ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       index: 2);
    //
    return MediaQuery.of(context).size.width > 500 ? webview() : moblieview();
  }

  Widget moblieview() {
    return ScreenTemplate1(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppService.categories == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : AppService.categories?.isEmpty ?? false
                          ? const Center(
                              child: Text('No Data'),
                            )
                          : SingleChildScrollView(
                              child: ListView.builder(
                                  controller: ScrollController(),
                                  shrinkWrap: true,
                                  itemCount: AppService.categories?.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: CategoryWidget(
                                        index: index,
                                        onClicked: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => AllBooksPage(
                                                        categoryTitle:
                                                            AppService
                                                                .categories!
                                                                .elementAt(
                                                                    index),
                                                      )));
                                        },
                                      ),
                                    );
                                  }),
                            ),
                ),
              ),
            ],
          ),
        ),
        index: 2);
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
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppService.categories == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : AppService.categories?.isEmpty ?? false
                              ? const Center(
                                  child: Text('No Data'),
                                )
                              : SingleChildScrollView(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: AppService.categories?.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: CategoryWidget(
                                            index: index,
                                            onClicked: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder:
                                                          (_) => AllBooksPage(
                                                                categoryTitle: AppService
                                                                    .categories!
                                                                    .elementAt(
                                                                        index),
                                                              )));
                                            },
                                          ),
                                        );
                                      }),
                                ),
                    ),
                  ),
                ])),
              ))
        ],
      ),
    );
  }
}
