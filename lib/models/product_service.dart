import 'package:dio/dio.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
