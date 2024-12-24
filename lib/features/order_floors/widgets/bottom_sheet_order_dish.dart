import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/models/dish_model.dart';

class BottomSheetOrderDish extends StatelessWidget {
  const BottomSheetOrderDish({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
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
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.close),),
             const Text('Đặt món',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
            ],
          ),
          const Divider(),
         const Text('Các món đã chọn',style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: mockDishes.listDishes.length,
              itemBuilder: (context, index) {
                final dish = mockDishes.listDishes[index];
                return _generateDishItem(dish);
              },
            ),
          ),
          const Divider(),
         const Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tạm tính : ',style: TextStyle(fontWeight: FontWeight.w600)),
              Text('100.000đ',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.red)),
            ],
          ),
          const SizedBox(height: 25,),
           Row(
            children: [
              Expanded(
                child: Container(
                  padding:const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Hủy',style: TextStyle(
                    color: Colors.black,
                  ),
                    textAlign: TextAlign.center,

                  ),
                ),
              ),
              const SizedBox(width: 6,),
              Expanded(
                child: Container(
                  padding:const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Đặt món',style: TextStyle(
                    color: Colors.white,
                  ),
                    textAlign: TextAlign.center,
                
                  ),
                ),
              ),

            ],
          )
        ],
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
                    IconButton(onPressed: () {}, icon:const Icon(  Icons.add,color: Colors.green,),),
                    const SizedBox(width: 5,),
                    IconButton(onPressed: () {}, icon:const Icon(  Icons.remove,color: Colors.red,),),
                  ],
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon:const Icon(  Icons.playlist_remove_rounded,color: Colors.black,),),
        ],
      ),
    );
  }
}