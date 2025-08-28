import 'package:clot_shopping/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Clot());
}

class Clot extends StatelessWidget {
  const Clot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xff8E6CEF),
        scaffoldBackgroundColor: Color(0xffF4F4F4),
        secondaryHeaderColor: Color.fromARGB(255, 227, 222, 222),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          headlineSmall: TextStyle(fontSize: 16, color: Colors.black87),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      home: SigninScreen(),
    );
  }
}
