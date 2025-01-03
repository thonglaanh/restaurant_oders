import 'package:flutter/material.dart';
import 'package:untitled/base/bloc/bloc_base.dart';
import 'package:untitled/base/bloc/bloc_provider.dart';
import 'package:untitled/features/bill/bill_screen.dart';
import 'package:untitled/features/counter/counter_bloc.dart';
import 'package:untitled/features/counter/counter_screen.dart';
import 'package:untitled/features/home/home_screen.dart';
import 'package:untitled/features/login/login_screen.dart';
import 'package:untitled/features/profile/profile_screen.dart';
import 'package:untitled/features/root/root_screen.dart';
import 'package:untitled/features/splash/splash_screen.dart';
import 'package:untitled/features/unknown/unknown_screen.dart';

class RouteScreen {
  static PageRoute splashPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const SplashScreen(),
    );
  }

  static PageRoute loginPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const LoginScreen(),
    );
  }

  static PageRoute rootPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const RootScreen(),
    );
  }

  static PageRoute counterPageRoute(RouteSettings settings) {
    BlocProvider.counter = createAutoDisposeBloc(
      (ref) => CounterBloc(ref),
    );
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const CounterScreen(),
    );
  }

  static PageRoute unknownPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const UnknownScreen(),
    );
  }

  static PageRoute homePageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const HomeScreen(),
    );
  }

  static PageRoute billPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const BillScreen(),
    );
  }

  static PageRoute profilePageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const ProfileScreen(),
    );
  }
}
