import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../model/consulta.dart';
import 'consultas_viewmodel.dart';

class ConsultasView extends StackedView<ConsultasViewModel> {
  const ConsultasView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConsultasViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas'),
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
                    viewModel.navigateToCrearConsulta();
                  },
                  child: const Text('Nueva Consulta'),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _buildConsultasTable(viewModel.consultas)
          ],
        ),
      ),
    );
  }

  Widget _buildConsultasTable(List<ConsultaAndTratamiento> consulta) {
    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.black),
      headingTextStyle: const TextStyle(color: Colors.white),
      border: const TableBorder(
        horizontalInside: BorderSide(width: 1, color: Colors.black),
        top: BorderSide(width: 1, color: Colors.black),
        bottom: BorderSide(width: 1, color: Colors.black),
        left: BorderSide(width: 1, color: Colors.black),
        right: BorderSide(width: 1, color: Colors.black),
      ),
      columns: const [
        DataColumn(label: Text('Paciente')),
        DataColumn(label: Text('Fecha')),
        DataColumn(label: Text('Tratamiento')),
        DataColumn(label: Text('Actividad realizada')),
        DataColumn(label: Text('Abono')),
        DataColumn(label: Text('Indicaciones')),
      ],
      rows: consulta
          .map(
            (consulta) => DataRow(
              cells: [
                DataCell(Text(consulta.tratamiento.actividad)),
                DataCell(Text(
                    DateFormat('dd/MM/yyyy').format(consulta.consulta.fecha))),
                DataCell(Text(consulta.tratamiento.actividad)),
                DataCell(Text(consulta.consulta.actividadRealizada)),
                DataCell(Text(consulta.consulta.abono.toString())),
                DataCell(Text(consulta.consulta.indicaciones)),
              ],
            ),
          )
          .toList(),
    );
  }

  @override
  ConsultasViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConsultasViewModel();
}
