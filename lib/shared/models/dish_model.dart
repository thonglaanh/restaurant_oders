class DishModel {
  final String name;
  final String description;
  final String image;
  final double price;
  final int quantity;

  const DishModel({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
  });
}

class MockDishes {
  static const List<DishModel> listDishes = [
    DishModel(
      name: 'Phở bò',
      description: 'Phở bò Hà Nội, nước dùng thơm ngon, thịt bò tươi mềm',
      image:
          'https://i.pinimg.com/736x/b5/e3/96/b5e396afcbacfc99007e33bdba6e8941.jpg',
      price: 60000,
      quantity: 1,
    ),
    DishModel(
      name: 'Gỏi cuốn',
      description: 'Gỏi cuốn tươi mát, cuốn tôm thịt, rau sống, và bún',
      image:
          'https://i.pinimg.com/736x/c4/30/1a/c4301a79d5107ab4bac7a22bdeb79a00.jpg',
      price: 40000,
      quantity: 0,
    ),
    DishModel(
      name: 'Bánh mì',
      description: 'Bánh mì kẹp thịt, rau, và các loại gia vị đặc trưng',
      image:
          'https://i.pinimg.com/736x/f3/a9/5f/f3a95f5871bf9085e6df7d044fd102ac.jpg',
      price: 25000,
      quantity: 1,
    ),
    DishModel(
      name: 'Cơm tấm',
      description: 'Cơm tấm Sài Gòn, thịt nướng mềm và ngon',
      image:
          'https://i.pinimg.com/736x/f2/4d/0a/f24d0a1e2d893d88b91280c4a289d056.jpg',
      price: 55000,
      quantity: 0,
    ),
  ];
}
