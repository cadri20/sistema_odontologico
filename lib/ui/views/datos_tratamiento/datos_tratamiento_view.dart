import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sistema_odontologico/ui/common/consultas_table.dart';
import 'package:sistema_odontologico/ui/common/personal_data_widget.dart';
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
              _buildDatosTratamientoWithMap(tratamiento, viewModel),
              _buildConsultasSection(viewModel.consultas, viewModel, context),
            ],
          )),
    );
  }

  Widget _buildDatosTratamientoWithMap(TratamientoAndPaciente tratamiento, DatosTratamientoViewModel viewModel) {
    return PersonalData(
      {
        'Actividad': tratamiento.tratamiento.actividad,
        'Costo': tratamiento.tratamiento.costo.toString(),
        'Paciente': tratamiento.paciente.nombre,
        'Saldo': viewModel.saldo.toString(),
      }
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
    return ConsultasTable(consultas: consultas, onUpdateConsultas: viewModel.initialise,);
  }

  @override
  DatosTratamientoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DatosTratamientoViewModel(tratamiento);
}
