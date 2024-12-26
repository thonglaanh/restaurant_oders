import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/base/dependency/app_service.dart';
import 'package:untitled/shared/models/dish_model.dart';
import 'package:untitled/shared/svgs/svg_restaurant.dart';

class BottomSheetOrderDish extends ConsumerWidget {
  const BottomSheetOrderDish({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final routerService = ref.watch(AppService.router);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minHeight: height * 0.4,
          maxHeight: height * 0.7,
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
                const Text(
                  'Đặt món',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
            const Divider(),
            const Text(
              'Các món đã chọn',
              style: TextStyle(fontWeight: FontWeight.w600),
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
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tạm tính : ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  '100.000đ',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Hủy',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(routerService.rootContext)
                            .showSnackBar(
                          const SnackBar(
                            content: Text('Đặt món thanh cong'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      child: const Text(
                        'Đặt món',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                Text(
                  'Số lượng: ${dish.quantity}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${dish.price} VNĐ',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.string(SvgRestaurant.delete),
          ),
        ],
      ),
    );
  }
}
