import 'dart:async';
import 'package:appucv2/pages/LoginOrRegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(LoginOrRegisterPage());
    });

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: const Center(
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 120.0,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('images/galeriachilalo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
