class ProductModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final ProductRating rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData["id"],
        title: jsonData["title"],
        price: jsonData["price"],
        description: jsonData["description"],
        category: jsonData["category"],
        image: jsonData["image"],
        rating: ProductRating.fromJson(jsonData["rating"]));
  }
}

class ProductRating {
  final num rate;
  final num count;

  ProductRating({required this.rate, required this.count});

  factory ProductRating.fromJson(jsonData) {
    return ProductRating(rate: jsonData["rate"], count: jsonData["count"]);
  }
}
