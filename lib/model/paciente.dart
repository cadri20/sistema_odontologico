import 'dart:math';

class Paciente {
  int id;
  String nombre;
  DateTime? fechaNacimiento;
  String direccion;
  String cedula;
  String celular;

  int? get edad{
    if(fechaNacimiento == null) return null;
    final now = DateTime.now();
    final period = fechaNacimiento?.difference(now);

    return period == null ? null : period.inDays.abs() ~/ 365;
  }

  Paciente({
    required this.id,
    required this.nombre,
    required this.fechaNacimiento,
    required this.direccion,
    required this.cedula,
    required this.celular,
  });

  Paciente.withRandomId({
    required this.nombre,
    required this.fechaNacimiento,
    required this.direccion,
    required this.cedula,
    required this.celular,
  }) : id = Random().nextInt(1000);

  Paciente.empty()
      : this(
            id: 0,
            nombre: '',
            fechaNacimiento: null,
            direccion: '',
            cedula: '',
            celular: '');

  Paciente copy({
    int? id,
    String? nombre,
    DateTime? fechaNacimiento,
    String? direccion,
    String? cedula,
    String? celular,
  }) {
    return Paciente(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
      direccion: direccion ?? this.direccion,
      cedula: cedula ?? this.cedula,
      celular: celular ?? this.celular,
    );
  }

  Paciente.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nombre = json['attributes']['nombre'],
        fechaNacimiento =
        json['attributes']['fecha_nacimiento'] != null ? DateTime.parse(json['attributes']['fecha_nacimiento']) : null,
        direccion = json['attributes']['direccion'] ?? '',
        cedula = json['attributes']['cedula'] ?? '',
        celular = json['attributes']['celular'] ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'nombre': nombre,
      'fecha_nacimiento': fechaNacimiento?.toString(),
      'direccion': direccion,
      'cedula': cedula,
      'celular': celular
    };
    if (id != 0) {
      map['id'] = id;
    }

    return map;
  }
}
