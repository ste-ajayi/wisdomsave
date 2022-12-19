import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wisdomsave/auth/login.dart';
import 'package:http/http.dart' as http;

import '../utilities/general_utils.dart';
import '../utilities/text_utils.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Image.asset('assets/images/authimg1.jpg'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create account",
                    style: t40w7.copyWith(color: Color(0xff508BE2)),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    decoration: outInput.copyWith(hintText: "Username"),
                    controller: _usernameController,
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
                          var username = _usernameController.text;
                          var email = _emailController.text;
                          var password = _passwordController.text;

                          var url =
                              Uri.parse('http://localhost:1200/auth/register');
                          var res = await http.post(url, body: {
                            "username": username,
                            "email": email,
                            "password": password
                          });

                          if (res.statusCode == 200) {
                            Get.to(Login());
                          }
                          ;
                        },
                        child: Row(children: [
                          Text(
                            'Sign up',
                            style: t24w3,
                          ),
                          Icon(
                            Icons.arrow_circle_right,
                            color: primarycolor,
                          )
                        ]),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => Get.to(Login()),
              child: Text(
                'Already have an account',
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
