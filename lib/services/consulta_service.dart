import 'package:sistema_odontologico/services/paciente_service.dart';
import 'package:sistema_odontologico/services/tratamiento_service.dart';

import '../app/app.locator.dart';
import '../model/consulta.dart';
import '../model/consulta_dao.dart';
import '../model/consulta_dao_rest.dart';
import 'auth_service.dart';

class ConsultaService {
  late ConsultaDao _dao;
  final _authService = locator<AuthService>();
  final _tratamientoService = locator<TratamientoService>();

  ConsultaService() {
    _dao = ConsultaDaoRest(_authService.jwtToken);
  }

  Future<List<Consulta>> getConsultas() async {
    var consultas = await _dao.getConsultas();
    return consultas;
  }

  Future<void> addConsulta(Consulta consulta) async {
    await _dao.insertConsulta(consulta);
  }

  Future<void> updateConsulta(Consulta consulta) async {
    await _dao.updateConsulta(consulta);
  }

  Future<void> deleteConsulta(int id) async {
    await _dao.deleteConsulta(id);
  }

  Future<Consulta> getConsulta(int id) async {
    return _dao.getConsulta(id);
  }

  Future<List<ConsultaAndTratamiento>>
      getConsultasAndPacientesAndTratamiento() async {
    var consultas = await _dao.getConsultas();
    var consultasAndPacientesAndTratamiento = <ConsultaAndTratamiento>[];

    for (var consulta in consultas) {
      var tratamiento =
          await _tratamientoService.getTratamiento(consulta.idTratamiento);
      consultasAndPacientesAndTratamiento.add(ConsultaAndTratamiento(
        consulta: consulta,
        tratamiento: tratamiento,
      ));
    }
    return consultasAndPacientesAndTratamiento;
  }

  Future<List<ConsultaAndTratamiento>> getConsultasAndTratamientosDePaciente(
      int idPaciente) async {
    var consultasAndTratamiento = <ConsultaAndTratamiento>[];
    var tratamientos =
        await _tratamientoService.getTratamientosDePaciente(idPaciente);

    for (var tratamiento in tratamientos) {
      var consultas = await _dao.getConsultasDeTratamiento(tratamiento.id);
      for (var consulta in consultas) {
        consultasAndTratamiento.add(ConsultaAndTratamiento(
          consulta: consulta,
          tratamiento: tratamiento,
        ));
      }
    }

    return consultasAndTratamiento;
  }

  Future<List<Consulta>> getConsultasDeTratamiento(int idTratamiento) async {
    return _dao.getConsultasDeTratamiento(idTratamiento);
  }
}
