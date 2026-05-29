import 'package:dio/dio.dart';
import 'package:octafitpro/features/store/data/category_model.dart';

class CategoryService {
  final Dio dio = Dio();

  final String baseUrl = "http://127.0.0.1:8000/api";

  Future<List<CategoryModel>> getCategories() async {
    final response = await dio.get("$baseUrl/categories");

    final data = CategoryResponse.fromJson(response.data);

    return data.data;
  }
}
