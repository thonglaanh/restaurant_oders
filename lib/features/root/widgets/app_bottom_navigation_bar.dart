import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/base/bloc/bloc_provider.dart';
import 'package:untitled/base/rx/obs_builder.dart';
import 'package:untitled/features/root/enums/navigation_bottom_tab_enum.dart';
import 'package:untitled/shared/svgs/svg_restaurant.dart';

class AppBottomNavigationBar extends ConsumerWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final appBloc = ref.watch(BlocProvider.app);

    return ObsBuilder(
      streams: [appBloc.selectedBottomTabSubject],
      builder: (ctx) {
        final currentIndex = NavigationBottomTabExtension.toIndex(
          appBloc.selectedBottomTabSubject.value,
        );

        return BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            appBloc.onBottomTabChange(
              NavigationBottomTabExtension.fromIndex(index),
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.string(
                SvgRestaurant.home,
                color: currentIndex == 0 ? Colors.black : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.string(
                SvgRestaurant.bill,
                color: currentIndex == 1 ? Colors.black : Colors.grey,
              ),
              label: 'Bill',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.string(
                SvgRestaurant.profile,
                color: currentIndex == 2 ? Colors.black : Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        );
      },
    );
  }
}
