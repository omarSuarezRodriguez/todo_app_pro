import 'package:get/get.dart';

import '../../../../core/services/storage_service.dart';
import '../../data/datasources/home_local_data_source.dart';
import '../../data/repositories/home_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLocalDataSource>(
      () => HomeLocalDataSource(Get.find<StorageService>()),
    );

    Get.lazyPut<HomeRepository>(
      () => HomeRepository(Get.find<HomeLocalDataSource>()),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<HomeRepository>()),
    );
  }
}