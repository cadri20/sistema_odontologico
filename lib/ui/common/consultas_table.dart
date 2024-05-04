import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sistema_odontologico/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../model/consulta.dart';
import '../../services/consulta_service.dart';
import '../views/datos_tratamiento/datos_tratamiento_viewmodel.dart';
import 'delete_dialog.dart';

class ConsultasTable extends StatefulWidget {
  const ConsultasTable({
    super.key,
    required this.consultas,
    required this.onUpdateConsultas
  });

  final List<Consulta> consultas;
  final Function onUpdateConsultas;

  @override
  State<ConsultasTable> createState() => _ConsultasTableState();
}

class _ConsultasTableState extends State<ConsultasTable>{
  final _navigationService = locator<NavigationService>();
  final _consultaService = locator<ConsultaService>();

  void sortByFecha(bool ascending) {
    widget.consultas.sort((a, b) =>
        ascending ? a.fecha.compareTo(b.fecha) : b.fecha.compareTo(a.fecha));
  }

  void editarConsulta(Consulta consulta){
    _navigationService.navigateToEditarConsultaView(consulta: consulta, isEditing: true)
        .then((value) {
      if (value != null) {
        setState(() {
          widget.onUpdateConsultas();
        });
      }
    });
  }

  void eliminarConsulta(Consulta consulta) async {
    await _consultaService.deleteConsulta(consulta.id);
    widget.onUpdateConsultas();
  }

  @override
  Widget build(BuildContext context) {
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
                setState(() {
                  sortByFecha(ascending);
                });
              },
            ),
            DataColumn(label: Text('Actividad realizada')),
            DataColumn(label: Text('Abono')),
            DataColumn(label: Text('Indicaciones')),
            DataColumn(label: Text('Acciones'))
          ],
          rows: widget.consultas
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
                      editarConsulta(consulta);
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
                                eliminarConsulta(consulta),
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
}