import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/provider/bookprovider.dart';
import 'package:flutter_application_1/view/widgets/homebook.dart';
import 'package:provider/provider.dart';

class AllBooksPage extends StatefulWidget {
  final String? categoryTitle;
  const AllBooksPage({Key? key, this.categoryTitle}) : super(key: key);

  @override
  State<AllBooksPage> createState() => _AllBooksPageState();
}

class _AllBooksPageState extends State<AllBooksPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    if (widget.categoryTitle != null) {
      Provider.of<BookProvider>(context, listen: false)
          .getCategoryBooks(context, title: widget.categoryTitle ?? '');
    } else {
      Provider.of<BookProvider>(context, listen: false).getAllBooks(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.categoryTitle != null ? widget.categoryTitle! : 'All Books',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: widget.categoryTitle != null ? categoryBookBody() : allBookBody(),
    );
  }

  Widget allBookBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Provider.of<BookProvider>(context).allBooks == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Provider.of<BookProvider>(context).allBooks!.isEmpty
                ? Center(
                    child: Text('No Data'),
                  )
                : Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: Provider.of<BookProvider>(context)
                        .allBooks!
                        .map((e) => bookwidget(book: e))
                        .toList(),
                  ),
      ),
    );
  }

  Widget categoryBookBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Provider.of<BookProvider>(context).categoryBooks == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Provider.of<BookProvider>(context).categoryBooks!.isEmpty
                ? Center(
                    child: Text('No Data'),
                  )
                : Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: Provider.of<BookProvider>(context)
                        .categoryBooks!
                        .map((e) => bookwidget(book: e))
                        .toList(),
                  ),
      ),
    );
  }
}
