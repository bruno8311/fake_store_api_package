import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import 'package:dartz/dartz.dart';

class UserApi {
  static const String baseUrl = 'https://fakestoreapi.com/users';

  // Obtener todos los usuarios
  Future<Either<String, List<UserItemModel>>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final users = data
            .map((e) => UserItemModel.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        return Right(users);
      } else {
        return Left('Error en listar usuarios: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  // Obtener un usuario por id
  Future<Either<String, UserItemModel>> fetchUser(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Right(UserItemModel.fromJson(Map<String, dynamic>.from(data)));
      } else {
        return Left('Error en obtener usuario: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  // Crear un usuario
  Future<Either<String, void>> createUser(UserItemModel user) async {
    try {
      final bodyRequest = jsonEncode(user.toJson());
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: bodyRequest,
      );
      if (response.statusCode == 201) {
        return Right(null);
      } else {
        return Left('Error en crear usuario: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  // Actualizar un usuario
  Future<Either<String, void>> updateUser(UserItemModel user) async {
    try {
      final bodyRequest = jsonEncode(user.toJson());
      final response = await http.put(
        Uri.parse('$baseUrl/${user.id}'),
        headers: {'Content-Type': 'application/json'},
        body: bodyRequest,
      );
      if (response.statusCode == 200) {
        return Right(null);
      } else {
        return Left('Error en actualizar usuario: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  // Eliminar un usuario
  Future<Either<String, void>> deleteUser(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return Right(null);
      } else {
        return Left('Error en eliminar usuario: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }
}
