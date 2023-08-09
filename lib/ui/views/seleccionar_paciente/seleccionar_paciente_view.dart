import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/paciente.dart';
import '../../../model/tratamiento.dart';
import 'seleccionar_paciente_viewmodel.dart';

class SeleccionarPacienteView
    extends StackedView<SeleccionarPacienteViewModel> {
  final EntidadSeleccionada entidad;
  const SeleccionarPacienteView(this.entidad, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SeleccionarPacienteViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: viewModel.entidad == EntidadSeleccionada.paciente
            ? const Text('Seleccionar Paciente')
            : const Text('Seleccionar Tratamiento'),
      ),
      body: Container(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(150, 50)),
                  ),
                  onPressed: () {
                    viewModel.navigateToCrearEntidad();
                  },
                  child: viewModel.entidad == EntidadSeleccionada.paciente
                      ? const Text('Nuevo Paciente')
                      : const Text('Nuevo Tratamiento'),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: viewModel.entidad == EntidadSeleccionada.paciente
                    ? _buildPacienteListView(viewModel.pacientes, viewModel)
                    : _buildTratamientoListView(
                        viewModel.tratamientos, viewModel))
          ])),
    );
  }

  Widget _buildPacienteListView(
      List<Paciente> pacientes, SeleccionarPacienteViewModel viewModel) {
    return ListView.builder(
      itemCount: pacientes.length,
      itemBuilder: (context, index) {
        final paciente = pacientes[index];
        return Card(
          child: ListTile(
            title: Text(paciente.nombre),
            subtitle: Text(paciente.cedula),
            onTap: () {
              viewModel.seleccionarPaciente(paciente);
            },
          ),
        );
      },
    );
  }

  Widget _buildTratamientoListView(
      List<Tratamiento> tratamientos, SeleccionarPacienteViewModel viewModel) {
    return ListView.builder(
      itemCount: tratamientos.length,
      itemBuilder: (context, index) {
        final tratamiento = tratamientos[index];
        return Card(
          child: ListTile(
            title: Text(tratamiento.actividad),
            subtitle: Text(tratamiento.costo.toString()),
            onTap: () {
              viewModel.seleccionarTratamiento(tratamiento);
            },
          ),
        );
      },
    );
  }

  @override
  SeleccionarPacienteViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SeleccionarPacienteViewModel(entidad);
}
