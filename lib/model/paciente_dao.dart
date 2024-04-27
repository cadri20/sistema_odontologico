import 'paciente.dart';

abstract class PacienteDao {
  Future<List<Paciente>> getPacientes();
  Future<Paciente> getPaciente(int id);
  Future<void> insertPaciente(Paciente paciente);
  Future<void> updatePaciente(Paciente paciente);
  Future<void> deletePaciente(int id);
  Future<List<Paciente>> searchPacientes(String nombre);
  Future<List<Paciente>> getPacientesOrderedByName(bool ascending);
}


