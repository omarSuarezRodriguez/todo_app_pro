import 'package:get/get.dart';

import '../../../../core/services/storage_service.dart';
import '../../data/datasources/tasks_local_data_source.dart';
import '../../data/repositories/tasks_repository.dart';
import '../controllers/tasks_controller.dart';

class TasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TasksLocalDataSource>(
      () => TasksLocalDataSource(Get.find<StorageService>()),
    );

    Get.lazyPut<TasksRepository>(
      () => TasksRepository(Get.find<TasksLocalDataSource>()),
    );

    Get.lazyPut<TasksController>(
      () => TasksController(Get.find<TasksRepository>()),
    );
  }
}