import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/features/widget/appbar_widget.dart';
import 'package:untitled/shared/providers/bottom_navigation_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static List<Map<String, dynamic>> listTab = [
    {'id': 1, 'name': 'Bàn 1'},
    {'id': 2, 'name': 'Bàn 2'},
    {'id': 3, 'name': 'Bàn 3'},
    {'id': 4, 'name': 'Bàn 4'},
    {'id': 5, 'name': 'Bàn 5'},
    {'id': 6, 'name': 'Bàn 6'},
  ];

  @override
  Widget build(BuildContext context, ref) {
    final homeRouter = ref.watch(BottomNavigationProvider.home);
    return const Scaffold(
      appBar: CustomAppbar(title: 'Chọn bàn'),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

// ElevatedButton(
//   onPressed: () {
//     homeRouter.push(RouteInput.counter());
//   },
//   child: const Text('To counter'),
// ),
