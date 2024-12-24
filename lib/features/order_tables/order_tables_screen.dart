import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/shared/icons/table_image.dart';

class OrderFloorsScreen extends StatefulWidget {
  const OrderFloorsScreen({super.key});

  @override
  State<OrderFloorsScreen> createState() => _OrderFloorsScreenState();
}

class _OrderFloorsScreenState extends State<OrderFloorsScreen> {
  String itemSelected = 'Tầng 1';
  final listLengends = [
    LengendItem(title: 'Trống', color: Colors.black),
    LengendItem(title: 'Đang phục vụ', color: Colors.cyan),
    LengendItem(title: 'Bàn đặt trước', color: Colors.amber),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Chọn Tầng'),
        backgroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                final isSelected = itemSelected == 'Tầng ${index + 1}';
                return _generateButtonTab(isSelected, 'Tầng ${index + 1}',
                        () {
                      setState(() {
                        itemSelected = 'Tầng ${index + 1}';
                      });
                    });
              }),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(listLengends.length, (index) {
              return _generateLengend(listLengends[index]);
            }),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1/1.2,
              ),
              itemCount: 20,
              itemBuilder: (context, index) =>
                  _getItemTable('Tầng ${index + 1}'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getItemTable(String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TableImage(
            width: 90,
          ),
          const Spacer(),
          Text(title),
        ],
      ),
    );
  }

  Widget _generateLengend(
      LengendItem lengendItem,
      ) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: lengendItem.color,
          ),
        ),
        Text(lengendItem.title),
      ],
    );
  }

  Widget _generateButtonTab(
      bool isSelected,
      String title,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.black : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
        ),
      ),
    );
  }
}

class LengendItem {
  final String title;
  final Color color;
  LengendItem({
    required this.title,
    required this.color,
  });
}
