import 'package:untitled/base/dependency/router/utils/route_name.dart';

class RouteInput {
  String routeName;
  Object? arguments;

  RouteInput({
    required this.routeName,
    this.arguments,
  });

  RouteInput.splash() : routeName = RouteName.splash;
  RouteInput.login() : routeName = RouteName.login;
  RouteInput.root() : routeName = RouteName.root;
  RouteInput.home() : routeName = RouteName.home;
  RouteInput.bill() : routeName = RouteName.bill;
  RouteInput.profile() : routeName = RouteName.profile;
  RouteInput.profileInfomation() : routeName = RouteName.profileInfomation;
  RouteInput.order() : routeName = RouteName.order;
  RouteInput.orderHistory() : routeName = RouteName.orderHistory;
  RouteInput.orderHistoryDetail() : routeName = RouteName.orderHistoryDetail;
  RouteInput.unknown() : routeName = RouteName.unknown;
}
