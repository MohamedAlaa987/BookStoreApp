import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/pages/categroy_page.dart';
import 'package:flutter_application_1/view/pages/checkout_page.dart';
import 'package:flutter_application_1/view/pages/home_page.dart';
import 'package:flutter_application_1/view/pages/searchpage.dart';

class ScreenTemplate1 extends StatelessWidget {
  final Widget body;
  final int index;
  const ScreenTemplate1({required this.body, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow.shade200,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'categroy',
          ),
        ],
        selectedItemColor: Colors.white,
        currentIndex: index,
        iconSize: 22,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                  (route) => false);
              break;
            case 1:
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => SearchPage()),
                  (route) => false);
              break;
            case 2:
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => cateroyPage()),
                  (route) => false);
              break;
            default:
          }
        },
      ),
    );
  }
}
