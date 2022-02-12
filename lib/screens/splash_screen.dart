import 'dart:async';

import '/screens/auth_users.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    __navigatetoUserAuth();
    super.initState();
  }

  Future<void> __navigatetoUserAuth() async {
    await Future.delayed(const Duration(milliseconds: 1500))
        .then((value) => Navigator.pushNamed(context, AuthUsers.routeMane));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 102, 0),
        child: const Center(
          child: Text(
            'Logo',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
