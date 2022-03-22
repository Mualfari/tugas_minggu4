import 'package:flutter/material.dart';
import 'package:tugas_minggu4/login_page.dart';
import 'package:tugas_minggu4/screen/home_screen.dart';
import 'package:tugas_minggu4/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
