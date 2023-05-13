import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/helpers/app_helpers.dart';
import 'package:flutter_application_1/provider/bookprovider.dart';
import 'package:flutter_application_1/view/pages/home_page.dart';
import 'package:flutter_application_1/view/widgets/screentemplate1.dart';
import 'package:provider/provider.dart';

class checkout extends StatefulWidget {
  final List<Map<String, dynamic>>? bookSelected;

  const checkout({required this.bookSelected, Key? key}) : super(key: key);

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Check Out Page',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: widget.bookSelected!
                  .map((e) => ListTile(
                        title: Text(e['title']),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Quantity : ${e['quantity']}'),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Price : ${e['price'] * e['quantity']}',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                        leading: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(e['image'] ?? ''),
                                  fit: BoxFit.contain)),
                        ),
                      ))
                  .toList(),
            ))),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  children: [
                    Text(
                      'Total Price ' +
                          '\$' +
                          Provider.of<BookProvider>(context, listen: false)
                              .getCartTotalPrice(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 22),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Provider.of<BookProvider>(context, listen: false)
                            .checkout(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Text(
                            'Check Out',
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
          ],
        ),
      ),
    );
  }
}
