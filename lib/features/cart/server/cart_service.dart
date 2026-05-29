class CartService {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<Map<String, dynamic>> items = [];

  void addItem(Map<String, dynamic> product) {
    final index = items.indexWhere(
      (item) => item["title"] == product["title"],
    );

    if (index != -1) {
      items[index]["qty"] += 1;
    } else {
      items.add({
        ...product,
        "qty": 1,
      });
    }
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  double get total {
    double sum = 0;
    for (var item in items) {
      sum += item["price"] * item["qty"];
    }
    return sum;
  }
}