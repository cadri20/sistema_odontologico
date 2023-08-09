import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/tratamiento.dart';
import 'editar_tratamiento_viewmodel.dart';

class EditarTratamientoView extends StackedView<EditarTratamientoViewModel> {
  final Tratamiento? tratamiento;
  final bool isEditing;
  const EditarTratamientoView(this.tratamiento, this.isEditing, {Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditarTratamientoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar Tratamiento' : 'Crear Tratamiento'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: viewModel.actividadTratamiento,
                decoration: const InputDecoration(
                  labelText: 'Actividad',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  viewModel.actividadTratamiento = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: viewModel.costoTratamiento == 0
                    ? ''
                    : '\$${viewModel.costoTratamiento}',
                decoration: const InputDecoration(
                  labelText: 'Costo',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  if (value.contains('\$')) {
                    value = value.replaceAll('\$', '');
                  }
                  double costo;
                  try {
                    costo = double.parse(value);
                  } catch (e) {
                    costo = 0;
                  }
                  viewModel.costoTratamiento = costo;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    viewModel.guardarTratamiento();
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(150, 50)),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  ),
                  child: Text('Guardar'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  EditarTratamientoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditarTratamientoViewModel(tratamiento ?? Tratamiento.empty(), isEditing);
}
