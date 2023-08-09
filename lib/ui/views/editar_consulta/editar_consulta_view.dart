import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../model/consulta.dart';
import 'editar_consulta_viewmodel.dart';

class EditarConsultaView extends StackedView<EditarConsultaViewModel> {
  final Consulta? consulta;
  final bool isEditing;

  const EditarConsultaView(this.consulta, this.isEditing, {Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditarConsultaViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar Consulta' : 'Crear Consulta'),
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DateTimeFormField(
                      initialValue: viewModel.consultaEditar.fecha,
                      decoration: const InputDecoration(
                        labelText: 'Fecha',
                        border: OutlineInputBorder(),
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      onDateSelected: (DateTime value) {
                        viewModel.consultaEditar =
                            viewModel.consultaEditar.copy(fecha: value);
                      },
                      dateFormat: DateFormat('dd/MM/yyyy'),
                    ),
                    TextFormField(
                      initialValue: viewModel.consultaEditar.actividadRealizada,
                      decoration: const InputDecoration(
                        labelText: 'Actividad Realizada',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        viewModel.consultaEditar = viewModel.consultaEditar
                            .copy(actividadRealizada: value);
                      },
                    ),
                    //TextField en formaato dinero
                    TextFormField(
                      initialValue: viewModel.consultaEditar.abono == 0
                          ? ''
                          : '\$${viewModel.consultaEditar.abono}',
                      decoration: const InputDecoration(
                        labelText: 'Abono',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        //Si tiene simbolo de dolar quitarlo y transformarlo a double
                        if (value.contains('\$')) {
                          value = value.replaceAll('\$', '');
                        }
                        double abono;
                        try {
                          abono = double.parse(value);
                        } catch (e) {
                          abono = 0;
                        }
                        viewModel.consultaEditar =
                            viewModel.consultaEditar.copy(abono: abono);
                      },
                    ),
                    TextFormField(
                      initialValue: viewModel.consultaEditar.indicaciones,
                      decoration: const InputDecoration(
                        labelText: 'Indicaciones',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        viewModel.consultaEditar =
                            viewModel.consultaEditar.copy(indicaciones: value);
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(200, 50)),
                      ),
                      onPressed: () {
                        viewModel.guardarConsulta();
                      },
                      child: const Text('Guardar'),
                    )
                  ]))),
    );
  }

  @override
  EditarConsultaViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditarConsultaViewModel(consulta ?? Consulta.empty(), isEditing);
}

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    print('oldValue: ${oldValue.text} and newValue: ${newValue.text}');
    return newValue.copyWith(
      text: '${_getSoloUnSimboloDeDolar(newValue.text)}\$',
    );
  }

  String _getSoloUnSimboloDeDolar(String cadena) {
    if (cadena.contains('\$')) {
      return cadena.replaceAll('\$', '');
    }
    return cadena;
  }
}
