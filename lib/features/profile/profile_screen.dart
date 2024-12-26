import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/base/dependency/app_service.dart';
import 'package:untitled/base/dependency/router/utils/route_name.dart';
import 'package:untitled/features/widget/appbar_widget.dart';
import 'package:untitled/shared/svgs/svg_restaurant.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerService = ref.watch(AppService.router);

    return Scaffold(
      appBar: const CustomAppbar(title: 'Hồ sơ'),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Divider(color: Color(0xFF4D5761), thickness: 0.1),
          _buildHeader(),
          const Divider(color: Color(0xFF4D5761), thickness: 0.1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildMenuItem(
                  text: 'Thông tin cá nhân',
                  icon: SvgRestaurant.computer,
                  onTap: () => _navigateTo(
                      routerService.rootContext, RouteName.profileInfomation),
                ),
                _buildMenuItem(
                  text: 'Lịch sử đặt bàn',
                  icon: SvgRestaurant.file_check,
                  onTap: () => _navigateTo(
                      routerService.rootContext, RouteName.orderHistory),
                ),
                _buildMenuItem(
                  text: 'Đăng xuất',
                  icon: SvgRestaurant.logout,
                  color: Colors.red,
                  onTap: () => _navigateTo(
                      routerService.rootContext, RouteName.login,
                      replace: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 104,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 31),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: Image.network(
                'https://th.bing.com/th/id/OIP.7UEBwNo3AsMFtY1RELU_9wHaHa?rs=1&pid=ImgDetMain',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nguyễn Văn A',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  'a@gmail.com',
                  style: TextStyle(fontSize: 14, color: Color(0xff4D5761)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String text,
    required String icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.string(icon),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style:
                        TextStyle(color: color ?? Colors.black, fontSize: 16),
                  ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFDADDE0), height: 2),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, String route, {bool replace = false}) {
    if (replace) {
      Navigator.pushReplacementNamed(context, route);
    } else {
      Navigator.pushNamed(context, route);
    }
  }
}
