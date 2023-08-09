import 'consulta.dart';

abstract class ConsultaDao {
  Future<List<Consulta>> getConsultas();
  Future<Consulta> getConsulta(int id);
  Future<void> insertConsulta(Consulta consulta);
  Future<void> updateConsulta(Consulta consulta);
  Future<void> deleteConsulta(int id);
  Future<List<Consulta>> getConsultasDeTratamiento(int idTratamiento);
}

class ConsultaDaoMemory implements ConsultaDao {
  List<Consulta> consultas = [
    Consulta(
      id: 1,
      idTratamiento: 1,
      fecha: DateTime.now(),
      actividadRealizada: 'Actividad realizada de la consulta 1',
      abono: 100,
      indicaciones: 'Indicaciones de la consulta 1',
    ),
    Consulta(
      id: 2,
      idTratamiento: 2,
      fecha: DateTime.now(),
      actividadRealizada: 'Actividad realizada de la consulta 2',
      abono: 200,
      indicaciones: 'Indicaciones de la consulta 2',
    ),
  ];

  @override
  Future<List<Consulta>> getConsultas() async {
    return consultas;
  }

  @override
  Future<Consulta> getConsulta(int id) async {
    return consultas.firstWhere((consulta) => consulta.id == id);
  }

  @override
  Future<void> insertConsulta(Consulta consulta) async {
    consultas.add(consulta);
  }

  @override
  Future<void> updateConsulta(Consulta consulta) async {
    consultas[consultas.indexWhere((element) => element.id == consulta.id)] =
        consulta;
  }

  @override
  Future<void> deleteConsulta(int id) async {
    consultas.removeWhere((consulta) => consulta.id == id);
  }

  @override
  Future<List<Consulta>> getConsultasDeTratamiento(int idTratamiento) async {
    return consultas
        .where((consulta) => consulta.idTratamiento == idTratamiento)
        .toList();
  }
}
