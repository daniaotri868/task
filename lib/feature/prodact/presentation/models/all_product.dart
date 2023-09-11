class AllProduct {
  AllProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  factory AllProduct.fromJson(Map<String, dynamic> json){
    return AllProduct(
      id: json["id"],
      title: json["title"],
      price: double.parse(json["price"].toString()),
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );
  }

}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });
  final double? rate;
  final int? count;

  factory Rating.fromJson(Map<String, dynamic> json){
    return Rating(
      rate: double.parse(json["rate"].toString()),
      // rate: json["rate"],
      count: json["count"],
    );
  }
}
