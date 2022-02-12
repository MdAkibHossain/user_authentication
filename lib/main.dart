import 'provider/auth.dart';
import 'screens/splash_screen.dart';

import 'screens/auth_users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Auth(),
      child: MaterialApp(
          title: 'User Auth',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
          routes: {
            AuthUsers.routeMane: (context) => const AuthUsers(),
          }),
    );
  }
}
