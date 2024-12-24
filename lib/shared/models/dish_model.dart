class DishModel {
  final String name;
  final String description;
  final String image;
  final double price;
  final int quantity;

  DishModel({required this.name, required this.description, required this.image, required this.price, required this.quantity});
}

class mockDishes {
  static List<DishModel> listDishes = [
    DishModel(name: 'Cơm chiên', description: 'Cơm chiên thập câm Hà Nội gia điều cua', image: 'https://img-global.cpcdn.com/recipes/15f8b467ebab05c2/680x482cq70/c%C6%A1m-chien-th%E1%BA%ADp-c%E1%BA%A9m-recipe-main-photo.jpg', price: 50000,quantity: 1),
    DishModel(name: 'Bún riêu', description: 'Bún riêu cua Hà Nội gia điều cua', image: 'https://img-global.cpcdn.com/recipes/15f8b467ebab05c2/680x482cq70/c%C6%A1m-chien-th%E1%BA%ADp-c%E1%BA%A9m-recipe-main-photo.jpg', price: 50000,quantity: 0),
    DishModel(name: 'Bún bò', description: 'Bún bò Huế số 1 Sài Gòn chứa tới hơn 1000 nguyên liệu từ khắp cửa Hà Nội gia điều cua', image: 'https://img-global.cpcdn.com/recipes/15f8b467ebab05c2/680x482cq70/c%C6%A1m-chien-th%E1%BA%ADp-c%E1%BA%A9m-recipe-main-photo.jpg', price: 50000,quantity: 1),
    DishModel(name: 'Bún chả', description: 'Bún chả Hà Nội', image: 'https://img-global.cpcdn.com/recipes/15f8b467ebab05c2/680x482cq70/c%C6%A1m-chien-th%E1%BA%ADp-c%E1%BA%A9m-recipe-main-photo.jpg', price: 50000,quantity: 0),
  ];
}