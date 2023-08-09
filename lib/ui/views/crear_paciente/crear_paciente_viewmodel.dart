import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/paciente.dart';
import '../../../services/paciente_service.dart';

class CrearPacienteViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _pacienteService = locator<PacienteService>();

  Paciente _pacienteEditado;
  Paciente get pacienteEditado => _pacienteEditado;
  set pacienteEditado(Paciente pacienteEditado) {
    _pacienteEditado = pacienteEditado;
    rebuildUi();
  }

  final TextEditingController nombreController;
  final bool isEditing;
  DateTime fechaNacimiento;
  final TextEditingController direccionController;

  CrearPacienteViewModel(this._pacienteEditado, this.isEditing)
      : nombreController = TextEditingController(text: _pacienteEditado.nombre),
        fechaNacimiento = _pacienteEditado.fechaNacimiento,
        direccionController =
            TextEditingController(text: _pacienteEditado.direccion);

  Future<void> crearPaciente() async {
    if (!isEditing) {
      await _pacienteService.createPaciente(pacienteEditado);
    } else {
      await _pacienteService.updatePaciente(pacienteEditado);
    }

    _navigationService.back(result: true);
  }
}
