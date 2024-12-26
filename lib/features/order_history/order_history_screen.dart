import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/base/dependency/app_service.dart';
import 'package:untitled/base/dependency/router/utils/route_input.dart';
import 'package:untitled/shared/svgs/svg_restaurant.dart';

class OrderHistoryScreen extends ConsumerStatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  ConsumerState<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends ConsumerState<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final routerService = ref.watch(AppService.router);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Lịch sử đặt bàn',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.string(SvgRestaurant.back, width: 60, height: 60),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Color(0x1A4D5761)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gần đây nhất',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 12,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      routerService.push(RouteInput.orderHistoryDetail());
                    },
                    child: _OrderHistoryItem(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _OrderHistoryItem() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://th.bing.com/th/id/OIP.7UEBwNo3AsMFtY1RELU_9wHaHa?rs=1&pid=ImgDetMain',
            width: 130,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Số bàn: 101',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                'Thời gian vào: 10:9 AM',
                style: TextStyle(fontSize: 14, color: Color(0xFF4D5761)),
              ),
              Text(
                'Thời gian ra: 10:9 AM',
                style: TextStyle(fontSize: 14, color: Color(0xFF4D5761)),
              ),
              Text(
                'Nhân viên: Nguyễn Văn A',
                style: TextStyle(fontSize: 14, color: Color(0xFF4D5761)),
              ),
            ],
          ),
        ),
        const Icon(Icons.keyboard_control),
      ],
    ),
  );
}
