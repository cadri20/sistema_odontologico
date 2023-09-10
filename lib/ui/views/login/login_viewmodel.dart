import 'package:flutter/material.dart';
import 'package:sistema_odontologico/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  String _usuario = "";

  String get usuario => _usuario;

  set usuario(String value) {
    _usuario = value;
    rebuildUi();
  }

  TextEditingController usuarioController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _password = "";

  String get password => _password;

  set password(String value) {
    _password = value;
    rebuildUi();
  }

  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  set isPasswordVisible(bool value) {
    _isPasswordVisible = value;
    rebuildUi();
  }

  bool isPasswordIncorrect = false;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    rebuildUi();
  }

  Future<bool> login() async {
    return await _authService.login(_usuario, _password);
  }

  void navigateToHome() {
    usuarioController.text = "";
    passwordController.text = "";
    _usuario = "";
    _password = "";
    rebuildUi();
    _navigationService.navigateToPacientesView();
  }
}
