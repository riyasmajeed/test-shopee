class Shoee {
  int id;
  String title;
  double price;
  String description;
  Category category;
  String image;
  Rating rating;

  Shoee({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  static Shoee fromJson(Map<String, dynamic> json) {
    return Shoee(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: _parseCategory(json['category']),
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }

  static Category _parseCategory(String category) {
    switch (category) {
      case 'electronics':
        return Category.ELECTRONICS;
      case 'jewelery':
        return Category.JEWELERY;
      case "men's clothing":
        return Category.MEN_S_CLOTHING;
      case "women's clothing":
        return Category.WOMEN_S_CLOTHING;
      default:
        throw Exception("Unknown category: $category");
    }
  }
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }

  toDouble() {}
}

enum Category {
  ELECTRONICS,
  JEWELERY,
  MEN_S_CLOTHING,
  WOMEN_S_CLOTHING
}