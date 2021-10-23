import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_firebase_ddd/presentation/routes/app_router.gr.dart';
import 'package:notes_firebase_ddd/providers.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final router = AutoRouter.of(context);
    authState.when(
      initial: () {},
      authenticated: () {
        print('authenticated');
      },
      unauthenticated: () => router.replaceNamed(SignInScreen.name),
    );
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
