class LoginRequest {
  String username;
  String password;
  LoginRequest({required this.username, required this.password});
}

class LoginResponse {
  final String token;
  LoginResponse({required this.token});
}