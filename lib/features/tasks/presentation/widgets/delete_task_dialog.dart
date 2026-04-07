import 'package:get/get.dart';

class DeleteTaskDialog {
  static void show({
    required String taskTitle,
    required Future<void> Function() onConfirm,
  }) {
    Get.defaultDialog(
      title: 'Eliminar tarea',
      middleText: '¿Seguro que quieres eliminar "$taskTitle"?',
      textCancel: 'Cancelar',
      textConfirm: 'Eliminar',
      onConfirm: () async {
        await onConfirm();
        Get.back();
      },
    );
  }
}