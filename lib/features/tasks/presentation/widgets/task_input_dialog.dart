import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/app_snackbar.dart';

class TaskInputDialog {
  static void show({
    required String title,
    String initialValue = '',
    required Function(String value) onConfirm,
  }) {
    final textController = TextEditingController(text: initialValue);

    Get.defaultDialog(
      title: title,
      radius: 12,
      content: TextField(
        controller: textController,
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Escribe aquí',
        ),
      ),
      textCancel: 'Cancelar',
      textConfirm: 'Guardar',
      onConfirm: () {
        final value = textController.text.trim();

        if (value.isEmpty) {
          AppSnackbar.error(
            title: 'Campo vacío',
            message: 'Debes escribir un texto para continuar.',
          );
          return;
        }

        onConfirm(value);
        Get.back();
      },
    );
  }
}