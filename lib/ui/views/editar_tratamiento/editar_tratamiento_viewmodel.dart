import 'package:flutter/cupertino.dart';
import 'package:sistema_odontologico/app/app.router.dart';
import 'package:sistema_odontologico/services/paciente_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/paciente.dart';
import '../../../model/tratamiento.dart';
import '../../../services/tratamiento_service.dart';
import '../seleccionar_paciente/seleccionar_paciente_viewmodel.dart';

class EditarTratamientoViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PacienteService _pacienteService = locator<PacienteService>();
  final TratamientoService _tratamientoService = locator<TratamientoService>();

  Tratamiento tratamientoEditado;
  bool _isEditing;

  String _actividadTratamiento = "";
  String get actividadTratamiento => _actividadTratamiento;
  set actividadTratamiento(String value) {
    _actividadTratamiento = value;
    rebuildUi();
  }

  double _costoTratamiento = 0;
  double get costoTratamiento => _costoTratamiento;

  set costoTratamiento(double value) {
    _costoTratamiento = value;
    rebuildUi();
  }

  int _idPaciente = 0;
  int get idPaciente => _idPaciente;

  Paciente _paciente = Paciente.empty();
  Paciente get paciente => _paciente;

  var pacienteController = TextEditingController();

  EditarTratamientoViewModel(this.tratamientoEditado, this._isEditing) {
    actividadTratamiento = tratamientoEditado.actividad;
    costoTratamiento = tratamientoEditado.costo;
    _idPaciente = tratamientoEditado.idPaciente;
  }

  void navigateToSeleccionarPaciente() {
    _navigationService
        .navigateToSeleccionarPacienteView(
            entidad: EntidadSeleccionada.paciente)
        .then((value) async {
      if (value != null) {
        _idPaciente = value;
        final pacienteObtenido =
            await _pacienteService.getPaciente(_idPaciente);
        pacienteController.value =
            TextEditingValue(text: pacienteObtenido.nombre);
        rebuildUi();
      }
    });
  }

  void guardarTratamiento() {
    tratamientoEditado.actividad = actividadTratamiento;
    tratamientoEditado.costo = costoTratamiento;
    tratamientoEditado.idPaciente = _idPaciente;

    if (_isEditing) {
      _tratamientoService.updateTratamiento(tratamientoEditado).then(
          (value) => _navigationService.back(result: true)
      );
    } else {
      _tratamientoService.createTratamiento(tratamientoEditado).then(
          (value) => _navigationService.back(result: true)
      );

    }

  }
}
