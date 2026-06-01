class ProductResponse {
  final bool status;
  final List<ProductModel> data;

  ProductResponse({required this.status, required this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      status: json['status'],
      data: List<ProductModel>.from(
        json['data'].map((x) => ProductModel.fromJson(x)),
      ),
    );
  }
}

class ProductModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final String price;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toCartMap() {
    return {"title": name, "price": price, "image": image};
  }
}
