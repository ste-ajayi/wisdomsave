import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wisdomsave/screens/dashboard.dart';
import 'package:wisdomsave/test.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (() {
      Get.to(Dashboard());
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
      child: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.cover,
      ),
    ));
  }
}
