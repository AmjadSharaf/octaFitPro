import 'package:dio/dio.dart';
import 'package:octafitpro/features/store/data/product_mode.dart';

class ProductService {
  final Dio dio = Dio();

  final String baseUrl = "http://127.0.0.1:8000/api";

  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get("$baseUrl/products");

    final data = ProductResponse.fromJson(response.data);

    return data.data;
  }
}
