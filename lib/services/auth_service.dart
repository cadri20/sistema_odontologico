import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  String _jwtToken = '';
  String _baseUrl = 'http://localhost:1337/api/auth/local';
  String get jwtToken => _jwtToken;
  set jwtToken(String value) {
    _jwtToken = value;
  }

  Future<bool> login(String usuario, String password) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'identifier': usuario, 'password': password}),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _jwtToken = jsonResponse['jwt'];
      return true;
    } else {
      return false;
    }
  }
}
