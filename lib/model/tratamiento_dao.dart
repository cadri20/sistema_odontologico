import 'package:sistema_odontologico/model/consulta_dao.dart';
import 'package:sistema_odontologico/model/tratamiento.dart';

import '../app/app.locator.dart';
import '../services/consulta_service.dart';
import 'consulta.dart';

abstract class TratamientoDao {
  Future<List<Tratamiento>> getTratamientos();
  Future<List<TratamientoAndPaciente>> getTratamientosAndPacientes();
  Future<Tratamiento> getTratamiento(int id);
  Future<void> insertTratamiento(Tratamiento tratamiento);
  Future<void> updateTratamiento(Tratamiento tratamiento);
  Future<void> deleteTratamiento(int id);

  Future<List<Tratamiento>> getTratamientosDePersona(int idPersona);
  Future<double> calcularSaldoDeTratamiento(Tratamiento tratamiento);
}

class TratamientoDaoMemory implements TratamientoDao {
  //ConsultaService _consultaService = locator<ConsultaService>();

  List<Tratamiento> tratamientos = [
    Tratamiento(
      id: 1,
      actividad: "Tratamiento 1",
      costo: 100,
      idPaciente: 1,
    ),
    Tratamiento(
      id: 2,
      actividad: "Tratamiento 2",
      costo: 200,
      idPaciente: 2,
    ),
  ];

  @override
  Future<List<Tratamiento>> getTratamientos() async {
    return tratamientos;
  }

  @override
  Future<Tratamiento> getTratamiento(int id) async {
    return tratamientos.firstWhere((tratamiento) => tratamiento.id == id);
  }

  @override
  Future<void> insertTratamiento(Tratamiento tratamiento) async {
    tratamientos.add(tratamiento.copy(id: tratamientos.length + 2));
  }

  @override
  Future<void> updateTratamiento(Tratamiento tratamiento) async {
    tratamientos[tratamientos
        .indexWhere((element) => element.id == tratamiento.id)] = tratamiento;
  }

  @override
  Future<void> deleteTratamiento(int id) async {
    tratamientos.removeWhere((tratamiento) => tratamiento.id == id);
  }

  @override
  Future<List<Tratamiento>> getTratamientosDePersona(int idPersona) async {
    return tratamientos
        .where((tratamiento) => tratamiento.idPaciente == idPersona)
        .toList();
  }

  @override
  Future<double> calcularSaldoDeTratamiento(Tratamiento tratamiento) async {
    double totalAbonos = 0;
    final consultas = await locator<ConsultaService>()
        .getConsultasDeTratamiento(tratamiento.id);
    for (Consulta consulta in consultas) {
      totalAbonos += consulta.abono;
    }

    return tratamiento.costo - totalAbonos;
  }

  @override
  Future<List<TratamientoAndPaciente>> getTratamientosAndPacientes() {
    // TODO: implement getTratamientosAndPacientes
    throw UnimplementedError();
  }
}
