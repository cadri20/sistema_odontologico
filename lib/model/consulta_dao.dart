import 'consulta.dart';

abstract class ConsultaDao {
  Future<List<Consulta>> getConsultas();
  Future<List<Consulta>> getConsultasDePaciente(int idPaciente);
  Future<Consulta> getConsulta(int id);
  Future<void> insertConsulta(Consulta consulta);
  Future<void> updateConsulta(Consulta consulta);
  Future<void> deleteConsulta(int id);
  Future<List<Consulta>> getConsultasDeTratamiento(int idTratamiento);
}
