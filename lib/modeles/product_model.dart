class ProductModel {
  final int id;

  final String title;

  final num price;

  final String description;

  final String image;
  final String category;

  final RatingData rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
       required this.category,
        required this.rating});

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      image: json["image"],
      category: json["category"],
      rating: RatingData.fromJson(json["rating"]),
    );
  }
}

class RatingData {
  final num rate;

  final num count;

  RatingData({required this.rate, required this.count});

  factory RatingData.fromJson(json) {
    return RatingData(
      rate: json["rate"],
      count: json["count"],
    );
  }
}
