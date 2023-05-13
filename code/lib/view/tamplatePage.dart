import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TamplatePage extends StatelessWidget {
  final Widget body;
  final Widget appbartitle;
  final Widget? drawer;
  const TamplatePage(
      {required this.body, required this.appbartitle, this.drawer, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MediaQuery.of(context).size.width > 500
            ? null
            : Drawer(
                child: drawer,
              ),
        appBar: MediaQuery.of(context).size.width > 500
            ? null
            : AppBar(
                title: appbartitle,
              ),
        body: MediaQuery.of(context).size.width > 500
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Material(
                    elevation: 15,
                    child: Container(
                      width: 250,
                      child: drawer,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 100,
                            color: Colors.red,
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: appbartitle,
                            ),
                          ),
                          Expanded(
                            child: body,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : body);
  }
}
