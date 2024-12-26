import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/base/dependency/app_service.dart';
import 'package:untitled/base/dependency/router/utils/route_input.dart';
import 'package:untitled/shared/svgs/svg_restaurant.dart';

class OrderHistoryDetailScreen extends ConsumerWidget {
  const OrderHistoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerservice = ref.watch(AppService.router);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context, routerservice),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle(title: 'Các món đã chọn'),
            _buildOrderItems(),
            const Divider(color: Color(0x1A4D5761), height: 2),
            const _InfoRow(label: 'Khuyến mãi:', value: '0'),
            const _InfoRow(label: 'Nhân viên:', value: 'Nguyễn Văn A'),
            const _InfoRow(label: 'Phương thức thanh toán:', value: 'Tiền mặt'),
            const _InfoRow(label: 'Tình trạng:', value: 'Đã thanh toán'),
            const Divider(color: Color(0x1A4D5761), height: 2),
            const _TotalPaymentRow(
              label: 'Tổng thanh toán:',
              value: '1.080.000 VND',
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, routerservice) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Chi tiết bàn số 101',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: SvgPicture.string(SvgRestaurant.back, width: 60, height: 60),
      ),
      actions: [
        IconButton(
          onPressed: () {
            routerservice.push(RouteInput.order());
          },
          icon: const Icon(Icons.add, size: 30),
        ),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(color: Color(0x1A4D5761)),
      ),
    );
  }

  Widget _buildOrderItems() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  'https://th.bing.com/th/id/OIP.7UEBwNo3AsMFtY1RELU_9wHaHa?rs=1&pid=ImgDetMain',
                  width: 130,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 6),
              const Expanded(
                child: _ItemDetails(),
              ),
              const Expanded(
                child: _ItemPrice(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Color(0xff4D5761)),
          ),
        ],
      ),
    );
  }
}

class _TotalPaymentRow extends StatelessWidget {
  final String label;
  final String value;

  const _TotalPaymentRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemDetails extends StatelessWidget {
  const _ItemDetails();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lẩu gà lá é',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        Text(
          'Số lượng: 1',
          style: TextStyle(fontSize: 14, color: Color(0xFF4D5761)),
        ),
        SizedBox(height: 8),
        Text(
          'Giá: 360.000',
          style: TextStyle(fontSize: 14, color: Color(0xFF4D5761)),
        ),
      ],
    );
  }
}

class _ItemPrice extends StatelessWidget {
  const _ItemPrice();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Thành tiền',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 32),
        Text(
          '360.000 VND',
          style: TextStyle(fontSize: 14, color: Colors.red),
        ),
      ],
    );
  }
}
