import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/bookprovider.dart';
import 'package:flutter_application_1/services/app_service.dart';
import 'package:flutter_application_1/view/pages/home_page.dart';
import 'package:flutter_application_1/view/pages/searchpage.dart';
import 'package:flutter_application_1/view/pages/splash_page.dart';
import 'package:flutter_application_1/view/tamplatePage.dart';
import 'package:flutter_application_1/view/widgets/homebook.dart';
import 'package:provider/provider.dart';

void main() {
  AppService.init();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Bookstore",
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SplashPage(),
      ),
    );
  }
}
