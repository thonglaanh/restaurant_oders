import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/shared/svgs/svg_infomation.dart';

class BottomSheetInfomation extends ConsumerWidget {
  const BottomSheetInfomation({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const Divider(),
              const Text(
                'Thông tin liên hệ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              _buildTextFiled(
                title: 'Họ và tên',
                icon: SvgInfomation.users_profiles,
              ),
              const SizedBox(
                height: 8,
              ),
              _buildTextFiled(
                title: 'Giới tính',
                icon: SvgInfomation.gender_male,
                hiden: false,
              ),
              const SizedBox(
                height: 8,
              ),
              _buildTextFiled(
                title: 'Số điện thoại',
                icon: SvgInfomation.call,
              ),
              const SizedBox(
                height: 8,
              ),
              _buildTextFiled(
                title: 'Địa chỉ',
                icon: SvgInfomation.location_on,
              ),
              const Text(
                'Ngày tham gia',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              _buildTextFiled(
                title: 'DD/MM/YYYY',
                icon: SvgInfomation.calendar_minus,
              ),
              const SizedBox(
                height: 8,
              ),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFiled({String? title, String? icon, bool hiden = true}) {
    return TextField(
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: Container(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.string(icon ?? SvgInfomation.users_profiles),
        ), // Icon before the text field
        suffixIcon: Container(
          padding: const EdgeInsets.all(10),
          child: hiden ? SvgPicture.string(SvgInfomation.edit) : null,
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        const Text(
          'Cập nhật thông tin',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
        ),
      ),
      child: Row(
        children: [
          _buildActionButton(
            label: 'Hủy',
            backgroundColor: const Color(0xffE5E7EB),
            textColor: const Color(0xff9DA4AE),
            onPressed: () {},
          ),
          const SizedBox(width: 6),
          _buildActionButton(
            label: 'Xác nhận',
            backgroundColor: Colors.black,
            textColor: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

// Example usage
void showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return const BottomSheetInfomation();
    },
  );
}
