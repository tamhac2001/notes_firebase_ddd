import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_firebase_ddd/domain/auth/sign_in_form/sign_in_form_state.dart';
import 'package:notes_firebase_ddd/providers.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInFormNotifierProvider);
    ref.listen<SignInFormState>(signInFormNotifierProvider, (state) {
      state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(failure.map(
                      cancelledByUser: (_) => 'Cancelled',
                      serverError: (_) => 'Server Error',
                      emailAlreadyInUse: (_) => 'Email Already In Use',
                      invalidEmailAndPasswordCombination: (_) => 'Invalid Email And Password')),
                ));
              }, (_) {
            //TODO: Navigate
          }));
    });
    return Form(
        autovalidateMode: state.showErrorMessages,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Text(
                '📝',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 130),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.email), labelText: 'Email'),
                autocorrect: false,
                onChanged: (value) => ref.read(signInFormNotifierProvider.notifier).emailChanged(value),
                validator: (_) => ref.read(signInFormNotifierProvider).emailAddress.value.fold(
                      (l) => l.maybeMap(invalidEmail: (_) => 'Invalid email', orElse: () => null),
                      (r) => null,
                    ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.lock), labelText: 'Password'),
                autocorrect: false,
                obscureText: true,
                onChanged: (value) => ref.read(signInFormNotifierProvider.notifier).passwordChanged(value),
                validator: (_) => ref.read(signInFormNotifierProvider).password.value.fold(
                      (l) => l.maybeMap(shortPassword: (_) => 'Short Password', orElse: () => null),
                      (r) => null,
                    ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: const Text('SIGN IN'),
                      onPressed: () {
                        // print('signIn pressed');
                        ref.watch(signInFormNotifierProvider.notifier).signInWithEmailAndPasswordPressed();
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: const Text('REGISTER'),
                      onPressed: () {
                        ref.watch(signInFormNotifierProvider.notifier).registerWithEmailAndPasswordPressed();
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              ElevatedButton(
                child: const Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  ref.watch(signInFormNotifierProvider.notifier).signInWithGooglePressed();
                },
              ),
            ],
          ),
        ));
  }
}
