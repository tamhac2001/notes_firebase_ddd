import 'package:flutter/material.dart';
import 'package:notes_firebase_ddd/presentation/sign_in/sign_in_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      home: const SignInScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          primaryColor: Colors.green[800],
          colorScheme: ThemeData.light().colorScheme.copyWith(secondary: Colors.blueAccent),
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ))),
    );
  }
}
