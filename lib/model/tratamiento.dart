import 'paciente.dart';

class Tratamiento {
  int id;
  String actividad;
  double costo;
  int idPaciente;

  Tratamiento({
    required this.id,
    required this.actividad,
    required this.costo,
    required this.idPaciente,
  });

  Tratamiento.empty() : this(id: 0, actividad: '', costo: 0, idPaciente: 0);

  Tratamiento copy({
    int? id,
    String? nombre,
    double? costo,
    int? idPaciente,
  }) {
    return Tratamiento(
      id: id ?? this.id,
      actividad: nombre ?? this.actividad,
      costo: costo ?? this.costo,
      idPaciente: idPaciente ?? this.idPaciente,
    );
  }

  Tratamiento.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          actividad: json['attributes']['actividad'],
          costo: json['attributes']['costo'] is double
              ? json['attributes']['costo']
              : json['attributes']['costo'].toDouble(),
          idPaciente: json['attributes']['paciente'] ?? 0,
        );

  Map<String, dynamic> toJson() =>
      {'actividad': actividad, 'costo': costo, 'paciente': idPaciente};
}

class TratamientoAndPaciente {
  Tratamiento tratamiento;
  Paciente paciente;

  TratamientoAndPaciente({
    required this.tratamiento,
    required this.paciente,
  });
}
