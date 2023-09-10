import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: viewModel.isBusy ? const CircularProgressIndicator() : _buildLogin(viewModel, context),
        ),
      ),
    );
  }

  Widget _buildLogin(LoginViewModel viewModel, BuildContext context){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Iniciar Sesión',
              style: TextStyle(fontSize: 30),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
              ),
              controller: viewModel.usuarioController,
              onChanged: (value) {
                viewModel.usuario = value;
              },
            ),
            KeyboardListener(
              focusNode: FocusNode(),
              onKeyEvent: (event) {
                if (event.logicalKey == LogicalKeyboardKey.enter) {
                  login(viewModel, context);
                }
              },
              child: TextFormField(
                obscureText: !viewModel.isPasswordVisible,
                controller: viewModel.passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(viewModel.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: viewModel.togglePasswordVisibility,
                  ),
                ),
                onChanged: (value) {
                  viewModel.password = value;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                login(viewModel, context);
              },
              child: const Text('Iniciar sesión'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void login(LoginViewModel viewModel, BuildContext context) {
    viewModel.login().then((passwordCorrect) {
      //viewModel.setBusy(false);

      if (passwordCorrect) {
        viewModel.navigateToHome();
      } else {
        viewModel.setBusy(false);
        viewModel.isPasswordIncorrect = true;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Contraseña o usuario incorrectos'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              ),
            ],
          ),
        );
      }
    });
    viewModel.setBusy(true);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
