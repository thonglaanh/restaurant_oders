import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/base/dependency/app_service.dart';
import 'package:untitled/base/dependency/router/utils/route_input.dart';
import 'package:untitled/features/widget/appbar_widget.dart';
import 'package:untitled/shared/svgs/svg_oder_floors.dart';
import 'package:untitled/shared/svgs/svg_restaurant.dart';

class BillScreen extends ConsumerWidget {
  const BillScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerService = ref.watch(AppService.router);
    return Scaffold(
      appBar: const CustomAppbar(title: 'Hóa đơn'),
      backgroundColor: Colors.white,
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
                icon_right: SvgRestaurant.computer,
              ),
              buildTextWithDivider(
                text1: 'Tình trạng: ',
                text2: 'Đã xác nhận',
                color: Colors.green,
                fontSize: 18,
                icon_right: SvgRestaurant.status_online,
              ),
              buildTextWithDivider(
                text1: 'Thời gian đặt bàn: ',
                text2: '10:00 AM',
                fontSize: 18,
                icon_right: SvgRestaurant.time_cop,
              ),
              buildTextWithDivider(
                text1: 'Nhân viên xác nhận: ',
                text2: 'Nguyễn Văn A',
                fontSize: 18,
                icon_right: SvgRestaurant.staff_symbol,
              ),
              buildTextWithDivider(
                text1: 'Mức thanh toán dự kiến: ',
                text2: '360.000 VND',
                color: Colors.red,
                fontSize: 18,
                icon_right: SvgRestaurant.money,
              ),
              GestureDetector(
                onTap: () {
                  routerService.push(RouteInput.orderHistoryDetail());
                },
                child: buildTextWithDivider(
                  text1: 'Món đã gọi',
                  fontSize: 18,
                  icon_right: SvgRestaurant.food_market,
                  icon_left: true,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SvgPicture.string(
                SvgOderFloors.hot_spring,
                width: 150,
                height: 150,
                color: const Color(0xFF9DA4AE),
              ),
              buildTextWithDivider(
                text2: 'Chúc quý khách một ngày tràn đầy năng lượng',
                color: const Color(0xFF9DA4AE),
                fontSize: 14,
                mainAxisAlignment: MainAxisAlignment.center,
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
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Row(
          children: [
            if (icon_right != null) ...[
              SvgPicture.string(icon_right),
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
    MainAxisAlignment? mainAxisAlignment,
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
          mainAxisAlignment:
              mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
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
