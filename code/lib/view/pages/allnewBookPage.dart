import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/view/widgets/homebook.dart';
import 'package:provider/provider.dart';

import '../../provider/bookprovider.dart';

class AllNewBooksPage extends StatefulWidget {
  const AllNewBooksPage({Key? key}) : super(key: key);

  @override
  State<AllNewBooksPage> createState() => _AllNewBooksPageState();
}

class _AllNewBooksPageState extends State<AllNewBooksPage> {
  @override
  void initState() {
    Provider.of<BookProvider>(context, listen: false)
        .getHomePagenewBooks(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'AllNewBooks',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: allnewBookBody(),
    );
  }

  Widget allnewBookBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Provider.of<BookProvider>(context).newBooks == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Provider.of<BookProvider>(context).newBooks!.isEmpty
                ? Center(
                    child: Text('No Data'),
                  )
                : Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: Provider.of<BookProvider>(context)
                        .newBooks!
                        .map((e) => bookwidget(book: e))
                        .toList(),
                  ),
      ),
    );
  }
}
