import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/home_info_model.dart';
import '../../data/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;

  HomeController(this.repository);

  final isLoading = false.obs;
  final homeInfo = HomeInfoModel(title: '').obs;
  final titleTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadHomeInfo();
  }

  Future<void> loadHomeInfo() async {
    try {
      isLoading.value = true;
      final data = await repository.getHomeInfo();
      homeInfo.value = data;
      titleTextController.text = data.title;
    } catch (e) {
      Get.snackbar('Error', 'No se pudo cargar la información');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateTitle() async {
    final newTitle = titleTextController.text.trim();

    if (newTitle.isEmpty) {
      Get.snackbar('Aviso', 'El título no puede estar vacío');
      return;
    }

    try {
      await repository.saveHomeTitle(newTitle);
      homeInfo.value = homeInfo.value.copyWith(title: newTitle);
      Get.snackbar('Éxito', 'Título guardado correctamente');
    } catch (e) {
      Get.snackbar('Error', 'No se pudo guardar el título');
    }
  }

  @override
  void onClose() {
    titleTextController.dispose();
    super.onClose();
  }
}