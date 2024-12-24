import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/features/order_floors/widgets/bottom_sheet_order_dish.dart';
import 'package:untitled/shared/models/dish_model.dart';

class UnknownScreen extends StatefulWidget {
  const UnknownScreen({super.key});

  @override
  State<UnknownScreen> createState() => _UnknownScreenState();
}

class _UnknownScreenState extends State<UnknownScreen> {

  final tabItems = [
    TabItem(icon: const Icon(Icons.restaurant), label: 'Món ăn'),
    TabItem(icon: const Icon(Icons.local_drink), label: 'Nước uống'),
    TabItem(icon: const Icon(Icons.fastfood), label: 'Combo'),
  ];


  void onTapShowBottomSheetOrderDish(BuildContext context){
    showModalBottomSheet(isScrollControlled: true,context: context, builder: (context) {
      return const BottomSheetOrderDish();
    },);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
            onPressed: () {
              onTapShowBottomSheetOrderDish(context);
            },
            icon: const Icon(Icons.menu_book),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm món ăn',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: const Icon(Icons.search_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: List.generate(tabItems.length, (index) {
                final isSelected = index == 0;
                return _generateButtonTab(
                  isSelected,
                  tabItems[index].label,
                  () {
                    setState(() {});
                  },
                );
              }),
            ),

            Expanded(child: ListView.builder(
              itemCount: mockDishes.listDishes.length,
              itemBuilder: (context, index) {
                final dish = mockDishes.listDishes[index];
                return _generateDishItem(dish);
              },
            )
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
                RichText(text: TextSpan(
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
                ),),
                Text(
                  '${dish.price} VNĐ',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

         IconButton(onPressed: () {}, icon:const Icon(  Icons.add,color: Colors.green,),),
        ],
      ),
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
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          children: [
            Icon(
              Icons.restaurant,
              color: isSelected ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 8),
            Text(
              title,
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
  final Icon icon;
  final String label;
  TabItem({
    required this.icon,
    required this.label,
  });
}

