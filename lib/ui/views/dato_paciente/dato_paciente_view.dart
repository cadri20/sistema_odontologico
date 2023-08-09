import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../model/consulta.dart';
import '../../../model/paciente.dart';
import '../../../model/tratamiento.dart';
import '../../common/delete_dialog.dart';
import 'dato_paciente_viewmodel.dart';

class DatoPacienteView extends StackedView<DatoPacienteViewModel> {
  final Paciente paciente;
  const DatoPacienteView(this.paciente, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DatoPacienteViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos del Paciente'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          children: [
            _buildDatosPaciente(paciente),
            _buildTratamientosSection(
                viewModel.tratamientos, context, viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildTratamientosSection(List<Tratamiento> tratamientos,
      BuildContext context, DatoPacienteViewModel viewModel) {
    return Expanded(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Tratamientos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      viewModel.navigateToCrearTratamiento();
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(150, 50)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(0)),
                    ),
                    child: const Text('Nuevo Tratamiento'),
                  ),
                  SizedBox(),
                ],
              ),
              SizedBox(height: 8),
              _buildTratamientosTable(
                  tratamientos,
                  context,
                  viewModel.navigateToEditarTratamiento,
                  viewModel.eliminarTratamiento,
                  viewModel.navigateToDatosTratamiento),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTratamientosTable(
      List<Tratamiento> tratamientos,
      BuildContext context,
      Function(Tratamiento) editarTratamiento,
      Function(Tratamiento) eliminarTratamiento,
      Function(Tratamiento) onSelectTratamiento) {
    return Expanded(
      child: SingleChildScrollView(
        child: DataTable(
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.black),
            headingTextStyle: const TextStyle(color: Colors.white),
            border: const TableBorder(
              horizontalInside: BorderSide(width: 1, color: Colors.black),
              top: BorderSide(width: 1, color: Colors.black),
              bottom: BorderSide(width: 1, color: Colors.black),
              left: BorderSide(width: 1, color: Colors.black),
              right: BorderSide(width: 1, color: Colors.black),
            ),
            showCheckboxColumn: false,
            columns: const [
              DataColumn(label: Text('Actividad')),
              DataColumn(label: Text('Costo')),
              DataColumn(label: Text('Acciones'))
            ],
            rows: [
              for (var tratamiento in tratamientos)
                DataRow(
                  onSelectChanged: (value) {
                    onSelectTratamiento(tratamiento);
                  },
                  cells: [
                    DataCell(Text(tratamiento.actividad)),
                    DataCell(Text('${tratamiento.costo}\$')),
                    DataCell(
                      Row(children: [
                        ElevatedButton(
                          onPressed: () {
                            editarTratamiento(tratamiento);
                          },
                          child: const Text('Editar'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DeleteDialog(
                                    onConfirm: () {
                                      eliminarTratamiento(tratamiento);
                                    },
                                    onCancel: () {},
                                  );
                                });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          child: const Text('Eliminar'),
                        ),
                      ]),
                    )
                  ],
                )
            ]),
      ),
    );
  }

  Widget _buildDatosPaciente(Paciente paciente) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre: ${paciente.nombre}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Cedula: ${paciente.cedula}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Celular: ${paciente.celular}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fecha de nacimiento: ${paciente.fechaNacimiento}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Edad: ${paciente.edad}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Direccion: ${paciente.direccion}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )),
    );
  }

  @override
  DatoPacienteViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DatoPacienteViewModel(paciente);
}
