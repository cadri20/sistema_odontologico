import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/tratamiento.dart';
import 'tratamientos_viewmodel.dart';

class TratamientosView extends StackedView<TratamientosViewModel> {
  const TratamientosView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TratamientosViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tratamientos'),
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
                      viewModel.navigateToCrearTratamiento();
                    },
                    child: const Text(
                      'Nuevo Tratamiento',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _buildTratamientosTable(
                  viewModel.tratamientos, viewModel.navigateToDatosTratamiento)
            ],
          )),
    );
  }

  Widget _buildTratamientosTable(List<TratamientoAndPaciente> tratamientos,
      Function(Tratamiento) onSelectTratamiento) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
            columns: const [
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Costo')),
              DataColumn(label: Text('Paciente')),
            ],
            showCheckboxColumn: false,
            rows: [
              for (var tratamientoAndPaciente in tratamientos)
                DataRow(
                  onSelectChanged: (value) {
                    onSelectTratamiento(tratamientoAndPaciente.tratamiento);
                  },
                  cells: [
                    DataCell(
                        Text(tratamientoAndPaciente.tratamiento.actividad)),
                    DataCell(Text(
                        tratamientoAndPaciente.tratamiento.costo.toString())),
                    DataCell(Text(tratamientoAndPaciente.paciente.nombre)),
                  ],
                )
            ]),
      ),
    );
  }

  @override
  TratamientosViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TratamientosViewModel();
}
