import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/base/bloc/bloc_provider.dart';
import 'package:untitled/base/rx/obs_builder.dart';
import 'package:untitled/features/root/enums/navigation_bottom_tab_enum.dart';

class AppBottomNavigationBar extends ConsumerWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final appBloc = ref.watch(BlocProvider.app);
    return ObsBuilder(
      streams: [appBloc.selectedBottomTabSubject],
      builder: (ctx) => BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: NavigationBottomTabExtension.toIndex(
          appBloc.selectedBottomTabSubject.value,
        ),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          appBloc
              .onBottomTabChange(NavigationBottomTabExtension.fromIndex(index));
        },
        items: const [
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/icons/home_icon.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/icons/bill_icon.png')),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/icons/profile_icon.png')),
            label: 'Profile',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
