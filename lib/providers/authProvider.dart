
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:modernlogintute/Enviroments.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
final String url = 'http://localhost:3636/api/auth/login';


Future Login (String email, String password) async {
final data = {
  'email': email,
  'password': password,
};
final uri = Uri.parse('http://localhost:3636/api/auth/login');
final resp =  await http.post(uri,
    body: jsonEncode(data),
    headers: {'Content-Type': 'application/json'}

);

print (resp.body);



}}
