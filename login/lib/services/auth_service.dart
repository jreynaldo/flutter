import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String apiUrl = 'http://localhost:9000/api/authenticate';

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({
        'username': email,
        'password': password,
        'rememberMe': false,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Puedes manejar el almacenamiento de tokens aquí
      return true;
    } else {
      return false;
    }
  }
}
