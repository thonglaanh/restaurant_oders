import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'login');
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.gif',
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
