import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:fake_store_api_package/data/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static const String baseUrl = 'https://fakestoreapi.com/auth/login';

  Future<Either<String, LoginItemResponse>> login(LoginItemRequest loginRequest) async {
    final url = Uri.parse(baseUrl);
    final bodyRequest = jsonEncode(loginRequest.toJson());
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: bodyRequest,
    );
    if (response.statusCode == 201) {
      return Right(LoginItemResponse.fromJson(jsonDecode(response.body)));
    } else {
      return Left("Error en la autenticación");
    }
  }
}