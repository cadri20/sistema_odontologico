import 'package:sistema_odontologico/app/app.router.dart';
import 'package:sistema_odontologico/services/consulta_service.dart';
import 'package:sistema_odontologico/services/tratamiento_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/consulta.dart';
import '../../../model/paciente.dart';
import '../../../model/tratamiento.dart';

class DatoPacienteViewModel extends BaseViewModel implements Initialisable {
  final TratamientoService _tratamientoService = locator<TratamientoService>();
  final ConsultaService _consultaService = locator<ConsultaService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final Paciente paciente;
  List<Tratamiento> tratamientos = [];
  List<ConsultaAndTratamiento> consultas = [];

  DatoPacienteViewModel(this.paciente);

  @override
  Future<void> initialise() async {
    tratamientos =
        await _tratamientoService.getTratamientosDePaciente(paciente.id);
    consultas = await _consultaService
        .getConsultasAndTratamientosDePaciente(paciente.id);
    rebuildUi();
  }

  void navigateToEditarTratamiento(Tratamiento tratamiento) {
    _navigationService
        .navigateToEditarTratamientoView(
            tratamiento: tratamiento, isEditing: true)
        .then((value) {
      if (value != null) {
        initialise();
      }
    });
  }

  void eliminarTratamiento(Tratamiento tratamiento) async {
    await _tratamientoService.deleteTratamiento(tratamiento.id);
    initialise();
  }

  void navigateToCrearTratamiento() {
    _navigationService
        .navigateToEditarTratamientoView(
            tratamiento: Tratamiento.empty().copy(idPaciente: paciente.id),
            isEditing: false)
        .then((value) {
      if (value != null) {
        initialise();
      }
    });
  }

  void navigateToDatosTratamiento(Tratamiento tratamiento) {
    _navigationService.navigateToDatosTratamientoView(
        tratamiento: TratamientoAndPaciente(
            tratamiento: tratamiento, paciente: paciente));
  }
}
