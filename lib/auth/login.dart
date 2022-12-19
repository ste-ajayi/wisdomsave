import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wisdomsave/screens/dashboard.dart';
import 'package:wisdomsave/services.dart';
import 'package:wisdomsave/utilities/general_utils.dart';
import 'package:wisdomsave/utilities/text_utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Image.asset('assets/images/authimg2.jpg'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign in",
                    style: t40w7.copyWith(color: Color(0xff508BE2)),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: outInput.copyWith(hintText: "Email"),
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: outInput.copyWith(hintText: "Password"),
                    controller: _passwordController,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();

                          var email = _emailController.text;
                          var password = _passwordController.text;

                          var jwt = await attemptlogin(email, password);

                          if (jwt != null) {
                            await prefs.setString('token', jwt);
                            print(jwt);
                            Get.to(Dashboard());
                          }
                          // } else {
                          //   AlertDialog(
                          //       title: Text("error"),
                          //       content: Text(
                          //           'No account was found matching that username and password'));
                          // }

                          // var url =
                          //     Uri.parse('http://localhost:1200/auth/login');
                          // var res = await http.post(url,
                          //     body: {"email": email, "password": password});

                          // print(res.statusCode);
                        },
                        child: Row(children: [
                          Text(
                            'Sign in',
                            style: t24w3,
                          ),
                          Icon(
                            Icons.arrow_circle_right,
                            color: primarycolor,
                            size: 30,
                          )
                        ]),
                      )
                    ],
                  )
                ],
              ),
            ),
            Text("Don't have an account")
          ]),
        ),
      ),
    );
  }
}
