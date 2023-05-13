import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/helpers/app_helpers.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/services/app_service.dart';
import 'package:flutter_application_1/view/pages/home_page.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/logo3.png'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Book Store',
                    style: GoogleFonts.almarai(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: nameController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == '') {
                                  return 'Please Enter Your Name';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email_rounded),
                                hintText: 'Username',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == '') {
                                  return 'Please Enter Your Password';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password_rounded),
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          await login(context, nameController,
                                              passwordController);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: Colors.amber.shade100,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Login',
                                          style: GoogleFonts.almarai(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(BuildContext context, TextEditingController nameController,
      TextEditingController passwordController) async {
    var response = await showFutureLoadingDialog(
        context: context,
        future: () =>
            http.post(Uri.parse('https://fakestoreapi.com/auth/login'), body: {
              "username": nameController.text,
              "password": passwordController.text,
            }).timeout(Duration(seconds: 7)));

    if (response.result?.statusCode == 200) {
      var token = jsonDecode(response.result!.body)['token'];

      var secondResponse = await showFutureLoadingDialog(
          title: 'Getting User Data',
          context: context,
          future: () => http
              .get(
                Uri.parse('https://fakestoreapi.com/users'),
              )
              .timeout(Duration(seconds: 7)));

      if (secondResponse.result?.statusCode == 200) {
        var users = List<User>.from(jsonDecode(secondResponse.result!.body)
            .map((e) => User.fromJson(e, token))).toList();

        var currentUser = users
            .where((element) => element.username == nameController.text)
            .toList()
            .first;

        AppService.setUser(currentUser);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
      } else {
        AppHelper.showDialogEx(context, 'Error In Getting Data');
        return;
      }
    } else {
      AppHelper.showDialogEx(context, response.result?.body ?? '');
    }
  }
}
