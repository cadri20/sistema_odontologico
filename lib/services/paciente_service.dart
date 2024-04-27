import 'package:sistema_odontologico/model/paciente_dao_rest.dart';

import '../app/app.locator.dart';
import '../model/paciente.dart';
import '../model/paciente_dao.dart';
import 'auth_service.dart';

class PacienteService {
  final _authService = locator<AuthService>();
  late PacienteDao _pacienteDao;

  PacienteService() {
    _pacienteDao = PacienteDaoRest(_authService.jwtToken);
    print("constructor pacienteservice");
  }

  Future<List<Paciente>> getPacientes() async {
    return _pacienteDao.getPacientes();
  }

  Future<Paciente> getPaciente(int id) async {
    return _pacienteDao.getPaciente(id);
  }

  Future<void> createPaciente(Paciente paciente) async {
    await _pacienteDao.insertPaciente(paciente);
  }

  Future<void> updatePaciente(Paciente paciente) async {
    await _pacienteDao.updatePaciente(paciente);
  }

  Future<void> deletePaciente(int id) async {
    await _pacienteDao.deletePaciente(id);
  }

  Future<List<Paciente>> searchPacientes(String nombre) async {
    return _pacienteDao.searchPacientes(nombre);
  }

  Future<List<Paciente>> getPacientesOrderedByName(bool ascending){
    return _pacienteDao.getPacientesOrderedByName(ascending);
  }
}
