import 'package:fake_store_api_package/data/models/login_model.dart';
import 'package:fake_store_api_package/domain/entities/login.dart';


extension LoginResponseMapper on LoginResponse {
  LoginItemResponse toModel() => LoginItemResponse(
        token: token,
      );
}

extension LoginItemResponseMapper on LoginItemResponse {
  LoginResponse toEntity() => LoginResponse(
        token: token,
      );
}

extension LoginItemRequestMapper on LoginRequest {
  LoginItemRequest toModel() => LoginItemRequest(
        username: username,
        password: password,
      );
}

extension LoginItemRequestEntityMapper on LoginItemRequest {
  LoginRequest toEntity() => LoginRequest(
        username: username,
        password: password,
      );
}

