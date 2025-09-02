import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../models/cart_model.dart';
import 'package:http/http.dart' as http;

class CartApi {
  static const String baseUrl = 'https://fakestoreapi.com/carts';

  // Obtener todos los carritos
  Future<Either<String, List<CartItemModel>>> fetchCarts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final carts = data
            .map((e) => CartItemModel.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        return Right(carts);
      } else {
        return Left('Error en listar carritos: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  // Obtener un carrito por id
  Future<Either<String, CartItemModel>> fetchCart(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Right(CartItemModel.fromJson(Map<String, dynamic>.from(data)));
      } else {
        return Left('Error en obtener carrito: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  // Crear un carrito
  Future<Either<String, void>> createCart(CartItemModel cart) async {
    try {
      final bodyRequest = jsonEncode(cart.toJson());
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: bodyRequest,
      );
      if (response.statusCode == 201) {
        return Right(null);
      } else {
        return Left('Error en crear carrito: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  // Actualizar un carrito
  Future<Either<String, void>> updateCart(CartItemModel cart) async {
    try {
      final bodyRequest = jsonEncode(cart.toJson());
      final response = await http.put(
        Uri.parse('$baseUrl/${cart.id}'),
        headers: {'Content-Type': 'application/json'},
        body: bodyRequest,
      );
      if (response.statusCode == 200) {
        return Right(null);
      } else {
        return Left('Error en actualizar carrito: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  // Eliminar un carrito
  Future<Either<String, void>> deleteCart(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return Right(null);
      } else {
        return Left('Error: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }
}
