import 'package:sistema_odontologico/services/paciente_service.dart';

import '../app/app.locator.dart';
import '../model/tratamiento.dart';
import '../model/tratamiento_dao.dart';
import '../model/tratamiento_dao_rest.dart';
import 'auth_service.dart';

class TratamientoService {
  final _authService = locator<AuthService>();

  late TratamientoDao _dao;
  PacienteService _pacienteService = locator<PacienteService>();

  TratamientoService() {
    _dao = TratamientoDaoRest(_authService.jwtToken);
  }

  Future<List<Tratamiento>> getTratamientos() async {
    var tratamientos = await _dao.getTratamientos();
    return tratamientos;
  }

  Future<void> createTratamiento(Tratamiento tratamiento) async {
    await _dao.insertTratamiento(tratamiento);
  }

  Future<void> updateTratamiento(Tratamiento tratamiento) async {
    await _dao.updateTratamiento(tratamiento);
  }

  Future<void> deleteTratamiento(int id) async {
    await _dao.deleteTratamiento(id);
  }

  Future<Tratamiento> getTratamiento(int id) async {
    return _dao.getTratamiento(id);
  }

  Future<List<TratamientoAndPaciente>> getTratamientosAndPacientes() async {
    /*var tratamientos = await _dao.getTratamientos();
    var tratamientosAndPacientes = <TratamientoAndPaciente>[];
    for (var tratamiento in tratamientos) {
      //print("el tratamiento ${tratamiento.nombre} tiene idPaciente ${tratamiento.idPaciente}");
      var paciente = await _pacienteService.getPaciente(tratamiento.idPaciente);
      tratamientosAndPacientes.add(
          TratamientoAndPaciente(tratamiento: tratamiento, paciente: paciente));
    }*/

    var tratamientosAndPacientes = await _dao.getTratamientosAndPacientes();
    return tratamientosAndPacientes;
  }

  Future<TratamientoAndPaciente> getTratamientoAndPaciente(int id) async {
    var tratamiento = await _dao.getTratamiento(id);
    var paciente = await _pacienteService.getPaciente(tratamiento.idPaciente);
    return TratamientoAndPaciente(tratamiento: tratamiento, paciente: paciente);
  }

  Future<List<Tratamiento>> getTratamientosDePaciente(int idPersona) {
    return _dao.getTratamientosDePersona(idPersona);
  }

  Future<double> calcularSaldoDeTratamiento(Tratamiento tratamiento) async {
    return _dao.calcularSaldoDeTratamiento(tratamiento);
  }
}
