import 'package:shoppee_app/model/apimodel.dart';

class Category {
  final String title;
  String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  // Category(title: "Shoes", image: "assets/shoes.jpg"),
  // Category(title: "Beauty", image: "assets/beauty.png"),
  // Category(title: "PC", image: "assets/pc.jpg"),
  // Category(title: "Mobile", image: "assets/mobile.jpg"),
  // Category(title: "Watch", image: "assets/watch.png"),
];

List<String> categoryImages = [
  "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
  "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
  "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
  "https://fakestoreapi.com/img/71YaDZUKTIL._AC_UL640_QL65_ML3_.jpg",
  "https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg",
];

void updateCategories(List<Shoee> shoeeList) {
  for (int i = 0; i < categories.length; i++) {
    if (i < shoeeList.length) {
      categories[i].image = shoeeList[i].image;
    } else {
      categories[i].image = categoryImages[i];
    }
  }
}