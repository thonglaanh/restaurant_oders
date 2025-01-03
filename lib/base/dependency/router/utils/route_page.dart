import 'package:flutter/material.dart';
import 'package:untitled/base/dependency/router/utils/route_screen.dart';

import 'package:untitled/base/dependency/router/utils/route_name.dart';

class RoutePage {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return RouteScreen.splashPageRoute(settings);
      case RouteName.login:
        return RouteScreen.loginPageRoute(settings);
      case RouteName.root:
        return RouteScreen.rootPageRoute(settings);
      case RouteName.counter:
        return RouteScreen.counterPageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGenerateHomeRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return RouteScreen.homePageRoute(settings);
      case RouteName.counter:
        return RouteScreen.counterPageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGenerateBillRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.settings:
        return RouteScreen.billPageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGenerateProfileRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.profile:
        return RouteScreen.profilePageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }
}
