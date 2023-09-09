import 'package:flutter/cupertino.dart';
import 'package:sistema_odontologico/app/app.router.dart';
import 'package:sistema_odontologico/ui/views/seleccionar_paciente/seleccionar_paciente_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/consulta.dart';
import '../../../services/consulta_service.dart';
import '../../../services/paciente_service.dart';
import '../../../services/tratamiento_service.dart';

class EditarConsultaViewModel extends BaseViewModel implements Initialisable {
  final _consultaService = locator<ConsultaService>();
  final _navigationService = locator<NavigationService>();
  final _pacienteService = locator<PacienteService>();
  final _tratamientoService = locator<TratamientoService>();

  Consulta _consultaEditar;
  Consulta get consultaEditar => _consultaEditar;
  set consultaEditar(Consulta consultaEditar) {
    _consultaEditar = consultaEditar;
    rebuildUi();
  }

  final bool isEditing;

  //final nombrePaciente = TextEditingController();
  final nombreTratamiento = TextEditingController();

  EditarConsultaViewModel(this._consultaEditar, this.isEditing);

  @override
  Future<void> initialise() async {
    if (isEditing) {
      //nombrePaciente.value = TextEditingValue(text: (await _pacienteService.getPaciente(_consultaEditar.idPaciente)).nombre);
      nombreTratamiento.value = TextEditingValue(
          text: (await _tratamientoService
                  .getTratamiento(_consultaEditar.idTratamiento))
              .actividad);
    }
    rebuildUi();
  }

  void navigateToSeleccionarTratamiento() {
    _navigationService
        .navigateToSeleccionarPacienteView(
            entidad: EntidadSeleccionada.tratamiento)
        .then((value) async {
      if (value != null) {
        _consultaEditar = _consultaEditar.copy(idTratamiento: value);
        nombreTratamiento.value = TextEditingValue(
            text: (await _tratamientoService.getTratamiento(value)).actividad);
        print("se actualizo el nombre ${nombreTratamiento.value.text}");
        rebuildUi();
      }
    });
  }

  void guardarConsulta() {
    if (isEditing) {
      _consultaService.updateConsulta(_consultaEditar).then(
          (value) => _navigationService.back(result: true)
      );
    } else {
      _consultaService.addConsulta(_consultaEditar).then(
          (value) => _navigationService.back(result: true)
      );
    }
    //_navigationService.back(result: true);
  }
}
