class ProductModel {
  final String title;
  final String category;
  final String descrip;
  final String price;
  final String image;
  final String uId;

  ProductModel({
    required this.title,
    required this.category,
    required this.price,
    required this.descrip,
    required this.image,
    required this.uId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json["title"],
      category: json["category"],
      descrip: json["descrip"],
      image: json["image"],
      uId: json["uId"], price: json["price"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "category": category,
      "descrip": descrip,
      "image": image,
      "uId": uId,
      "price": price,
    };
  }
}
