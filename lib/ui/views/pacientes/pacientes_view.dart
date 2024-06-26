import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';


import '../../../model/paciente.dart';
import '../../common/delete_dialog.dart';
import 'pacientes_viewmodel.dart';

class PacientesView extends StackedView<PacientesViewModel> {
  const PacientesView({Key? key}) : super(key: key);

  Future<bool> _onWillPop(BuildContext context) async{
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Salir'),
        content: const Text('¿Esta seguro de que desea cerrar sesión?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Si'),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget builder(
    BuildContext context,
    PacientesViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Pacientes'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(const Size(150, 50)),
                      ),
                      onPressed: () {
                        viewModel.navigateToCrearPaciente();
                      },
                      child: const Text('Nuevo Paciente'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Buscar Paciente',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    viewModel.searchPacientes(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                viewModel.isBusy ? const CircularProgressIndicator() : _buildPacientesTable(viewModel.pacientes, viewModel, context),
              ],
            ),
          )),
    );
  }

  Widget _buildPacientesTable(List<Paciente> paciente,
      PacientesViewModel viewModel, BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FittedBox(
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
            columns: [
              DataColumn(
                  label: Text('Nombre'),
                  onSort: (_, ascending) {
                    viewModel.sortByNombre(ascending);
                  }),
              DataColumn(label: Text('Cedula')),
              DataColumn(label: Text('Celular')),
              DataColumn(label: Text('Dirección')),
              DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Fecha de Nacimiento'),
                      ],
                    ),
                  ),
                  onSort: (_, __) {
                    viewModel.pacientes.sort(
                        (a, b) => (a.fechaNacimiento ?? DateTime.fromMicrosecondsSinceEpoch(0)).compareTo(b.fechaNacimiento ?? DateTime.fromMicrosecondsSinceEpoch(0)));
                    viewModel.pacientes = viewModel.pacientes;
                  }),
              DataColumn(label: Text('Edad')),
              DataColumn(label: Text('Acciones'))
            ],
            rows: paciente
                .map((paciente) => DataRow(
                        onSelectChanged: (value) {
                          viewModel.navigateToDatosPaciente(paciente);
                        },
                        cells: [
                          DataCell(Text(paciente.nombre)),
                          DataCell(Text(paciente.cedula)),
                          DataCell(Text(paciente.celular)),
                          DataCell(Text(paciente.direccion)),
                          DataCell(Text(paciente.fechaNacimiento == null ? "" : DateFormat('dd/MM/yyyy')
                              .format(paciente.fechaNacimiento!))),
                          DataCell(Text(paciente.edad == null ? "" : paciente.edad.toString())),
                          DataCell(
                            Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      viewModel
                                          .navigateToEditarPaciente(paciente);
                                    },
                                    child: const Text('Editar')),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return DeleteDialog(
                                              onConfirm: () {
                                                viewModel
                                                    .deletePaciente(paciente);
                                              },
                                              onCancel: () {});
                                        });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                  ),
                                  child: const Text('Eliminar'),
                                )
                              ],
                            ),
                          ),
                        ]))
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  PacientesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PacientesViewModel();
}
