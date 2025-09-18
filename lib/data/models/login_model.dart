class LoginItemResponse {
  final String token;

  LoginItemResponse({required this.token});

  factory LoginItemResponse.fromJson(Map<String, dynamic> json) {
    return LoginItemResponse(
      token: json['token'],
    );
  }
}

class LoginItemRequest {
  final String username;
  final String password;

  LoginItemRequest({required this.username, required this.password});
  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}