import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final Function onConfirm;
  final Function onCancel;

  const DeleteDialog(
      {Key? key, required this.onConfirm, required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Eliminar'),
      content: const Text('¿Está seguro que desea eliminar?'),
      actions: [
        TextButton(
          onPressed: () {
            onCancel();
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.pop(context);
          },
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
