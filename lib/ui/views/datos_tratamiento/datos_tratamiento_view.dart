import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../model/consulta.dart';
import '../../../model/tratamiento.dart';
import '../../common/delete_dialog.dart';
import 'datos_tratamiento_viewmodel.dart';

class DatosTratamientoView extends StackedView<DatosTratamientoViewModel> {
  final TratamientoAndPaciente tratamiento;

  const DatosTratamientoView(this.tratamiento, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DatosTratamientoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos del Tratamiento'),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            children: [
              _buildDatosTratamiento(tratamiento, viewModel),
              _buildConsultasSection(viewModel.consultas, viewModel, context),
            ],
          )),
    );
  }

  Widget _buildDatosTratamiento(
      TratamientoAndPaciente tratamiento, DatosTratamientoViewModel viewModel) {
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
                    'Actividad: ${tratamiento.tratamiento.actividad}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Costo: ${tratamiento.tratamiento.costo}\$',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paciente: ${tratamiento.paciente.nombre}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Saldo: ${viewModel.saldo}\$',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          )),
    );
  }

  Widget _buildConsultasSection(List<Consulta> consultas,
      DatosTratamientoViewModel viewModel, BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Consultas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      viewModel.navigateToCrearConsulta();
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(150, 50)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(0)),
                    ),
                    child: const Text(
                      'Nueva Consulta',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _buildConsultasTable(consultas, viewModel, context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConsultasTable(List<Consulta> consultas,
      DatosTratamientoViewModel viewModel, BuildContext context) {
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
          columns: [
            DataColumn(
              label: Text('Fecha'),
              onSort: (columnIndex, ascending) {
                viewModel.sortByFecha(ascending);
              },
            ),
            DataColumn(label: Text('Actividad realizada')),
            DataColumn(label: Text('Abono')),
            DataColumn(label: Text('Indicaciones')),
            DataColumn(label: Text('Acciones'))
          ],
          rows: consultas
              .map(
                (consulta) => DataRow(
                  cells: [
                    DataCell(
                        Text(DateFormat('dd/MM/yyyy').format(consulta.fecha))),
                    DataCell(Text(consulta.actividadRealizada)),
                    DataCell(Text('\$${consulta.abono}')),
                    DataCell(Text(consulta.indicaciones)),
                    DataCell(Row(children: [
                      ElevatedButton(
                        onPressed: () {
                          viewModel.navigateToEditarConsulta(consulta);
                        },
                        child: Text('Editar'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => DeleteDialog(
                                    onConfirm: () =>
                                        viewModel.eliminarConsulta(consulta),
                                    onCancel: () {},
                                  ));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        child: Text('Eliminar'),
                      ),
                    ]))
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  @override
  DatosTratamientoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DatosTratamientoViewModel(tratamiento);
}
