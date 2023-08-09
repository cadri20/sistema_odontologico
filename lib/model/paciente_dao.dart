import 'paciente.dart';

abstract class PacienteDao {
  Future<List<Paciente>> getPacientes();
  Future<Paciente> getPaciente(int id);
  Future<void> insertPaciente(Paciente paciente);
  Future<void> updatePaciente(Paciente paciente);
  Future<void> deletePaciente(int id);
  Future<List<Paciente>> searchPacientes(String nombre);
}

class PacienteDaoMemory implements PacienteDao {
  List<Paciente> pacientes = [
    Paciente(
        id: 1,
        cedula: "123456789",
        nombre: "Paciente 1",
        fechaNacimiento: DateTime.parse("1990-01-01"),
        direccion: "Direccion 1",
        celular: "0987654321"),
    Paciente(
        id: 2,
        cedula: "987654321",
        nombre: "Paciente 2",
        fechaNacimiento: DateTime.now(),
        direccion: "Direccion 2",
        celular: "1234567890"),
  ];

  @override
  Future<List<Paciente>> getPacientes() async {
    return pacientes;
  }

  @override
  Future<Paciente> getPaciente(int id) async {
    return pacientes.firstWhere((paciente) => paciente.id == id);
  }

  @override
  Future<void> insertPaciente(Paciente paciente) async {
    pacientes.add(paciente.copy(id: pacientes.length + 2));
  }

  @override
  Future<void> updatePaciente(Paciente paciente) async {
    pacientes[pacientes.indexWhere((element) => element.id == paciente.id)] =
        paciente;
  }

  @override
  Future<void> deletePaciente(int id) async {
    pacientes.removeWhere((paciente) => paciente.id == id);
  }

  @override
  Future<List<Paciente>> searchPacientes(String nombre) async {
    return pacientes
        .where((paciente) =>
            paciente.nombre.toLowerCase().contains(nombre.toLowerCase()))
        .toList();
  }
}
