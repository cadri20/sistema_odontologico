import 'package:sistema_odontologico/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/paciente.dart';
import '../../../services/paciente_service.dart';

class PacientesViewModel extends BaseViewModel implements Initialisable {
  final _pacienteService = locator<PacienteService>();
  final _navigationService = locator<NavigationService>();

  List<Paciente> _pacientes = [];
  List<Paciente> get pacientes => _pacientes;
  set pacientes(List<Paciente> value) {
    _pacientes = value;
    rebuildUi();
  }

  Future<void> fetchPacientes() async {
    _pacientes = await _pacienteService.getPacientes();
    setBusy(false);
    rebuildUi();
  }

  @override
  void initialise() {
    setBusy(true);
    fetchPacientes();

    print("PacientesViewModel initialise");
  }

  void navigateToCrearPaciente() {
    _navigationService
        .navigateToCrearPacienteView(isEditing: false, paciente: null)
        .then((value) {
      if (value != null) {
        fetchPacientes();
      }
    });
  }

  void navigateToDatosPaciente(Paciente paciente) {
    _navigationService.navigateToDatoPacienteView(paciente: paciente);
  }

  void navigateToEditarPaciente(Paciente paciente) {
    _navigationService
        .navigateToCrearPacienteView(isEditing: true, paciente: paciente)
        .then((value) {
      if (value != null) {
        fetchPacientes();
      }
    });
  }

  void deletePaciente(Paciente paciente) async {
    await _pacienteService.deletePaciente(paciente.id);
    fetchPacientes();
  }

  void searchPacientes(String nombre) async {
    _pacientes = await _pacienteService.searchPacientes(nombre);
    rebuildUi();
  }

  void sortByNombre(bool ascending) {
    setBusy(true);
    _pacienteService.getPacientesOrderedByName(ascending).then((value) {
      _pacientes = value;
      setBusy(false);
      rebuildUi();
    });
  }

  String _getApellido(String nombre) {
    var apellido = nombre.split(" ");
    apellido = apellido.sublist(1);
    if (apellido.length > 0) {
      return apellido.first;
    } else {
      return nombre;
    }
  }
}
