// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../sign_in/sign_in_screen.dart' as _i2;
import '../splash/splash_screen.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    SignInScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInScreen());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(SplashScreen.name, path: '/'),
        _i3.RouteConfig(SignInScreen.name, path: '/sign-in-screen')
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashScreen extends _i3.PageRouteInfo<void> {
  const SplashScreen() : super(name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for [_i2.SignInScreen]
class SignInScreen extends _i3.PageRouteInfo<void> {
  const SignInScreen() : super(name, path: '/sign-in-screen');

  static const String name = 'SignInScreen';
}
