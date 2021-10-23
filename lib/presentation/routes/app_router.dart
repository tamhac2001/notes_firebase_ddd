import 'package:auto_route/annotations.dart';
import 'package:notes_firebase_ddd/presentation/sign_in/sign_in_screen.dart';
import 'package:notes_firebase_ddd/presentation/splash/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen,initial: true),
    AutoRoute(page: SignInScreen),
  ],
)
class $AppRouter {}
