import 'dart:convert';
import 'package:http/http.dart' as http;

import '../app/app.locator.dart';
import 'config_service.dart';

class AuthService {
  String _jwtToken = '';
  late String _baseUrl;
  String get jwtToken => _jwtToken;
  set jwtToken(String value) {
    _jwtToken = value;
  }

  AuthService(){
    final apiUrl = locator<ConfigService>().configMap['url_backend']!;
    _baseUrl = "$apiUrl/api/auth/local";
  }

  Future<bool> login(String usuario, String password) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'identifier': usuario, 'password': password}),
    );
    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _jwtToken = jsonResponse['jwt'];
      return true;
    }else{
      return false;
    }
  }
}
