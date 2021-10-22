import 'package:flutter/material.dart';
import 'package:notes_firebase_ddd/presentation/sign_in/widgets/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body:  SignInForm(),
    );
  }
}
