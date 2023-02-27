import 'package:flutter/material.dart';

import 'package:modernlogintute/pages/home_page.dart';
import 'package:modernlogintute/providers/authProvider.dart';
import 'package:provider/provider.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => MyHomePage(),

        }
      ),
    );
  }
}
