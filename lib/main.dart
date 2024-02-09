import 'package:flutter/material.dart';
import 'package:versatil/src/pages/login/login_page.dart';
import 'package:versatil/src/utilities/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Versatil',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage()
      },
      theme: ThemeData(
        primaryColor: Colores.primaryColor,
      )
    );
  }
}

