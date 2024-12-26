import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/base/dependency/app_service.dart';
import 'package:untitled/base/dependency/router/utils/route_input.dart';
import 'package:untitled/base/dependency/router/utils/route_name.dart';
import 'package:untitled/shared/icons/table_image.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String itemSelected = 'Tầng 1';
  final listLengends = [
    LengendItem(title: 'Trống', color: Colors.black),
    LengendItem(title: 'Đang phục vụ', color: Colors.cyan),
    LengendItem(title: 'Bàn đặt trước', color: Colors.amber),
  ];

  @override
  Widget build(BuildContext context) {
    final routerservice = ref.watch(AppService.router);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Chọn bàn'),
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
                  childAspectRatio: 1 / 1.2,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      routerservice.push(RouteInput.order());
                    },
                    child: _getItemTable(
                      'Bàn ${index + 1}',
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
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

class LengendItem {
  final String title;
  final Color color;

  LengendItem({
    required this.title,
    required this.color,
  });
}
