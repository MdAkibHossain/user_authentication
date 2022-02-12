import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  Future<void> login(String email, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBh6XWXP7l0Bb29MHXUTW-OFg1egOZH3nQ');
    try {
      final responseData = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
    } catch (error) {
      rethrow;
    }
  }

  Future<void> register(String email, String password, String fullname,
      String phonenumber) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBh6XWXP7l0Bb29MHXUTW-OFg1egOZH3nQ');
    final url2 = Uri.parse(
        'https://fluttter-test-default-rtdb.firebaseio.com/userinfo.json');
    try {
      await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      await http.post(url2,
          body: json.encode({
            'fullname': fullname,
            'phonenumber': phonenumber,
          }));
    } catch (error) {
      //
    }
  }
}
