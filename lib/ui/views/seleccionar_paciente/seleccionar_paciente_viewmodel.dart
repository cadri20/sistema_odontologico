import 'package:sistema_odontologico/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/paciente.dart';
import '../../../model/tratamiento.dart';
import '../../../services/paciente_service.dart';
import '../../../services/tratamiento_service.dart';

enum EntidadSeleccionada { paciente, tratamiento }

class SeleccionarPacienteViewModel extends BaseViewModel
    implements Initialisable {
  final _pacienteService = locator<PacienteService>();
  final _tratamientoService = locator<TratamientoService>();
  final _navigationService = locator<NavigationService>();

  List<Paciente> pacientes = [];
  List<Tratamiento> tratamientos = [];

  EntidadSeleccionada entidad;

  SeleccionarPacienteViewModel(this.entidad);

  @override
  Future<void> initialise() async {
    if (entidad == EntidadSeleccionada.paciente) {
      pacientes = await _pacienteService.getPacientes();
    } else {
      tratamientos = await _tratamientoService.getTratamientos();
    }
    rebuildUi();
  }

  void seleccionarPaciente(Paciente paciente) {
    _navigationService.back(result: paciente.id);
  }

  void seleccionarTratamiento(Tratamiento tratamiento) {
    _navigationService.back(result: tratamiento.id);
  }

  void navigateToCrearEntidad() {
    var entidadCreada = entidad == EntidadSeleccionada.paciente
        ? _navigationService.navigateToCrearPacienteView(
            paciente: null, isEditing: false)
        : _navigationService.navigateToEditarTratamientoView(
            tratamiento: null, isEditing: false);
    entidadCreada.then((value) {
      if (value != null) {
        initialise();
      }
    });
  }
}
