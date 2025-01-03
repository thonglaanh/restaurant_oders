import 'package:untitled/base/dependency/router/utils/route_name.dart';

enum NavigatorBottomTabEnum { home, settings, profile }

extension NavigationBottomTabExtension on NavigatorBottomTabEnum {
  String get initialRoute {
    switch (this) {
      case NavigatorBottomTabEnum.home:
        return RouteName.home;
      case NavigatorBottomTabEnum.settings:
        return RouteName.settings;
      case NavigatorBottomTabEnum.profile:
        return RouteName.profile;
    }
  }

  static NavigatorBottomTabEnum fromIndex(int index) {
    switch (index) {
      case 0:
        return NavigatorBottomTabEnum.home;
      case 1:
        return NavigatorBottomTabEnum.settings;
      case 2:
        return NavigatorBottomTabEnum.profile;
    }
    return NavigatorBottomTabEnum.home;
  }

  static int toIndex(NavigatorBottomTabEnum tab) {
    switch (tab) {
      case NavigatorBottomTabEnum.home:
        return 0;
      case NavigatorBottomTabEnum.settings:
        return 1;
      case NavigatorBottomTabEnum.profile:
        return 2;
    }
  }
}
