import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:sistema_odontologico/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'SISTEMA ODONTOLOGICO',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            viewModel.errorInStartup
                ? _buildError(viewModel.errorMessage)
                : _buildCargando(viewModel.backendMessage),
          ],
        ),
      ),
    );
  }

  Widget _buildCargando(String message) {
    return  Column(
      children: [
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Iniciando base de datos...', style: TextStyle(fontSize: 16)),
            horizontalSpaceSmall,
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 6,
              ),
            )
          ],
        ),
        Text(message, style: const TextStyle(fontSize: 16))
      ],
    );
  }

  Widget _buildError(String errorMessage) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Error al iniciar base de datos', style: TextStyle(fontSize: 16)),
        horizontalSpaceSmall,
        Text(errorMessage, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
