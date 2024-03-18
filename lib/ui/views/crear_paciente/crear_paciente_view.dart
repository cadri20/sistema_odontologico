import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../model/paciente.dart';
import 'crear_paciente_viewmodel.dart';
import 'package:date_field/date_field.dart';

class CrearPacienteView extends StackedView<CrearPacienteViewModel> {
  final Paciente? paciente;
  final bool isEditing;

  const CrearPacienteView(this.paciente, this.isEditing, {Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CrearPacienteViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar Paciente' : 'Crear Paciente'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: viewModel.pacienteEditado.nombre,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    viewModel.pacienteEditado =
                        viewModel.pacienteEditado.copy(nombre: value);
                  },
                ),
                TextFormField(
                  initialValue: viewModel.pacienteEditado.cedula,
                  decoration: const InputDecoration(
                    labelText: 'Cedula',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    viewModel.pacienteEditado =
                        viewModel.pacienteEditado.copy(cedula: value);
                  },
                ),
                TextFormField(
                  initialValue: viewModel.pacienteEditado.celular,
                  decoration: const InputDecoration(
                    labelText: 'Telefono',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    viewModel.pacienteEditado =
                        viewModel.pacienteEditado.copy(celular: value);
                  },
                ),
                TextFormField(
                  initialValue: viewModel.pacienteEditado.direccion,
                  decoration: const InputDecoration(
                    labelText: 'Dirección',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    viewModel.pacienteEditado =
                        viewModel.pacienteEditado.copy(direccion: value);
                  },
                ),
                DateTimeFormField(
                  initialValue: viewModel.pacienteEditado.fechaNacimiento,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de Nacimiento',
                    border: OutlineInputBorder(),
                  ),
                  dateFormat: DateFormat('dd/MM/yyyy'),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime? value) {
                    viewModel.pacienteEditado =
                        viewModel.pacienteEditado.copy(fechaNacimiento: value);
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.crearPaciente();
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(150, 50)),
                  ),
                  child: const Text('Guardar'),
                )
              ],
            )),
      ),
    );
  }

  @override
  CrearPacienteViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CrearPacienteViewModel(paciente ?? Paciente.empty(), isEditing);
}
