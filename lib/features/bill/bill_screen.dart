import 'package:flutter/material.dart';
import 'package:untitled/features/widget/appbar_widget.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Hóa đơn'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12),
          child: Column(
            children: [
              buildText(
                text1: 'Thông tin hóa đơn',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              verticalSpacing(22),
              buildTextWithDivider(
                text1: 'Bàn số: ',
                text2: '1',
                fontSize: 18,
                icon_right: 'computer_icon.png',
              ),
              buildTextWithDivider(
                text1: 'Tình trạng: ',
                text2: 'Đã xác nhận',
                color: Colors.green,
                fontSize: 18,
                icon_right: 'status_icon.png',
              ),
              buildTextWithDivider(
                text1: 'Thời gian đặt bàn: ',
                text2: '10:00 AM',
                fontSize: 18,
                icon_right: 'time_icon.png',
              ),
              buildTextWithDivider(
                text1: 'Nhân viên xác nhận: ',
                text2: 'Nguyễn Xuân Duẫn',
                fontSize: 18,
                icon_right: 'staff_icon.png',
              ),
              buildTextWithDivider(
                text1: 'Mức thanh toán dự kiến: ',
                text2: '360.000 VND',
                color: Colors.red,
                fontSize: 18,
                icon_right: 'money_icon.png',
              ),
              buildTextWithDivider(
                text1: 'Món đã gọi',
                fontSize: 18,
                icon_right: 'food_icon.png',
                icon_left: true,
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/icons/hot_icon.png',
                width: 150,
                height: 150,
              ),
              buildTextWithDivider(
                text2: 'Chúc quý khách một ngày tràn đầy năng lượng',
                color: const Color(0xFF9DA4AE),
                fontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildText({
    String text1 = '',
    String text2 = '',
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? icon_right,
    bool? icon_left,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            if (icon_right != null) ...[
              Image.asset('assets/icons/$icon_right'),
              const SizedBox(width: 10),
            ],
            Text(
              text1,
              style: TextStyle(
                fontSize: fontSize ?? 16,
                fontWeight: fontWeight ?? FontWeight.normal,
              ),
            ),
            if (text2.isNotEmpty)
              Text(
                text2,
                style: TextStyle(
                  color: color ?? Colors.black,
                  fontSize: fontSize ?? 16,
                  fontWeight: fontWeight ?? FontWeight.normal,
                ),
              ),
          ],
        ),
        if (icon_left != null && icon_left) ...[
          const Icon(Icons.keyboard_arrow_right),
        ],
      ],
    );
  }

  /// Divider and text with spacing
  Widget buildTextWithDivider({
    String text1 = '',
    String text2 = '',
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? icon_right,
    bool? icon_left,
  }) {
    return Column(
      children: [
        buildText(
          text1: text1,
          text2: text2,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          icon_right: icon_right,
          icon_left: icon_left,
        ),
        verticalSpacing(12),
        const Divider(color: Color(0xFFDADDE0), height: 2),
        verticalSpacing(10),
      ],
    );
  }

  /// Reusable vertical spacing
  Widget verticalSpacing(double height) {
    return SizedBox(height: height);
  }
}
