import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/shared/providers/bottom_navigation_provider.dart';

import '../widget/appbar_widget.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRouter = ref.watch(BottomNavigationProvider.profile);
    return const Scaffold(
      appBar: CustomAppbar(title: 'Hồ sơ'),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
