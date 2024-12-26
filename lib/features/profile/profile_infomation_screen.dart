import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/features/profile/widgets/bottom_sheet_infomation.dart';
import 'package:untitled/shared/svgs/svg_infomation.dart';
import 'package:untitled/shared/svgs/svg_restaurant.dart';

class ProfileInfomationScreen extends ConsumerWidget {
  const ProfileInfomationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          // Hình ảnh tràn tabBar
          Image.network(
            'https://th.bing.com/th/id/OIP.7UEBwNo3AsMFtY1RELU_9wHaHa?rs=1&pid=ImgDetMain',
            width: double.infinity,
            height: 235,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top +
                8, // Đặt nút bên dưới thanh trạng thái
            left: 8,
            child: IconButton(
              icon: SvgPicture.string(
                SvgRestaurant.back,
                width: 40,
                height: 40,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top * 3.4,
            child: _header(context),
          ),
          Column(
            children: [
              const SizedBox(
                height: 320,
              ),
              buildText(
                text: 'Thông tin liên hệ',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                icon: SvgInfomation.introduce_svgrepo,
                leftCount: 16,
              ),
              const SizedBox(
                height: 19,
              ),
              buildText(
                text: '0123456789',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                icon: SvgInfomation.phone_calling,
                leftCount: 44,
              ),
              const SizedBox(
                height: 19,
              ),
              buildText(
                text: 'Ha Noi',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                icon: SvgInfomation.address,
                leftCount: 44,
              ),
              const SizedBox(
                height: 19,
              ),
              buildText(
                text: 'Ngày tham gia',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                icon: SvgInfomation.date_svgrepo,
                leftCount: 16,
              ),
              const SizedBox(
                height: 19,
              ),
              buildText(
                text: '22/12/2024',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                icon: SvgInfomation.date,
                leftCount: 44,
              ),
              const SizedBox(
                height: 19,
              ),
              buildText(
                text: '10 PM',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                icon: SvgInfomation.time,
                leftCount: 44,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 200,
                height: 36,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const BottomSheetInfomation();
                      },
                    );
                  },
                  child: const Text(
                    'Cập nhật',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _header(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8), // Đặt độ mờ 80%
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
              const SizedBox(
                width: 31,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nguyễn Văn A',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'A@gmail.com',
                    style: TextStyle(fontSize: 14, color: Color(0xff4D5761)),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xffFFCE54),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SvgPicture.string(
                    SvgRestaurant.gender_male,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(width: 51), //
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildText({
  required String text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  String? icon,
  double? leftCount = 0.22,
}) {
  return Padding(
    padding: EdgeInsets.only(left: leftCount ?? 0.22),
    child: Row(
      children: [
        SvgPicture.string(icon ?? SvgInfomation.call),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: color ?? Colors.black,
          ),
        ),
      ],
    ),
  );
}
