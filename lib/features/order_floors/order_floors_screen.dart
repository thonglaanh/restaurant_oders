import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/features/order_floors/widgets/bottom_sheet_order_dish.dart';
import 'package:untitled/shared/models/dish_model.dart';
import 'package:untitled/shared/svgs/svg_oder_floors.dart';
import 'package:untitled/shared/svgs/svg_restaurant.dart';

class OrderFloorsScreen extends ConsumerStatefulWidget {
  const OrderFloorsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OrderFloorsScreenState();
}

class _OrderFloorsScreenState extends ConsumerState<OrderFloorsScreen> {
  final List<TabItem> tabItems = [
    TabItem(icon: SvgOderFloors.hot_spring, label: 'Lẩu'),
    TabItem(icon: SvgOderFloors.hot_surface, label: 'Nướng'),
    TabItem(icon: SvgOderFloors.water_bottle, label: 'Nước'),
    TabItem(icon: SvgOderFloors.plus_user, label: 'Gọi thêm'),
  ];

  int selectedTabIndex = 0; // Tracks the selected tab

  void onTapShowBottomSheetOrderDish(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const BottomSheetOrderDish();
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.string(
            SvgRestaurant.back,
            width: 100,
            height: 100,
          ),
        ),
        title: const Text('Bàn số 101'),
        backgroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () => onTapShowBottomSheetOrderDish(context),
            icon: SvgPicture.string(SvgRestaurant.order),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm món ăn',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search_rounded),
                border: OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xff4d5761)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(tabItems.length, (index) {
                  final isSelected = selectedTabIndex == index;
                  return _generateButtonTab(
                    isSelected,
                    tabItems[index],
                    () {
                      setState(() {
                        selectedTabIndex = index;
                      });
                    },
                  );
                }),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: MockDishes.listDishes.length,
                itemBuilder: (context, index) {
                  final dish = MockDishes.listDishes[index];
                  return _generateDishItem(dish);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _generateDishItem(DishModel dish) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              dish.image,
              width: 130,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dish.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Flexible(
                  child: Text(
                    dish.description,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Số lượng: ',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: '${dish.quantity}',
                        style: const TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${dish.price} VNĐ',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _generateButtonTab(
    bool isSelected,
    TabItem item,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            SvgPicture.string(
              item.icon,
              width: 20,
              height: 20,
              color: isSelected
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xff4d5761),
            ),
            const SizedBox(width: 8),
            Text(
              item.label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabItem {
  final String icon;
  final String label;

  TabItem({
    required this.icon,
    required this.label,
  });
}