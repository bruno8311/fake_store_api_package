import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_item_model.dart';
import 'package:dartz/dartz.dart';

class ProductApi {
  static const String localKey = 'products';
  static const String baseUrl = 'https://fakestoreapi.com/products';



  Future<Either<String, List<ProductItemModel>>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if(response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final products = data.map((e) => ProductItemModel.fromJson(Map<String, dynamic>.from(e))).toList();
        return Right(products);
      } else {
        return Left('Error en listar productos: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  Future<Either<String, ProductItemModel>> fetchProduct(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Right(ProductItemModel.fromJson(Map<String, dynamic>.from(data)));
      } else {
        return Left('Error en obtener producto: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  Future<Either<String, void>> createProduct(ProductItemModel product) async {
    try {
      final bodyRequest = jsonEncode(product.toJson());
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: bodyRequest
      );
      if (response.statusCode == 201) {
        return Right(null);
      } else {
        return Left('Error en crear producto: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  Future<Either<String, void>> updateProduct(ProductItemModel product) async {
    try {
      final bodyRequest = jsonEncode(product.toJson());
      final response = await http.put(
        Uri.parse('$baseUrl/${product.id}'),
        body: bodyRequest,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return Right(null);
      } else {
        return Left('Error en actualizar producto: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  Future<Either<String, void>> deleteProduct(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return Right(null);
      } else {
        return Left('Error en eliminar producto: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }
}
