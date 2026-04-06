import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/services/storage_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GetStorage>(GetStorage(), permanent: true);
    Get.put<StorageService>(
      StorageService(Get.find<GetStorage>()),
      permanent: true,
    );
  }
}