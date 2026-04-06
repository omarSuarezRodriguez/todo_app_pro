import '../../../../core/constants/storage_keys.dart';
import '../../../../core/services/storage_service.dart';
import '../models/home_info_model.dart';

class HomeLocalDataSource {
  final StorageService storageService;

  HomeLocalDataSource(this.storageService);

  Future<HomeInfoModel> getHomeInfo() async {
    final storedTitle = storageService.read<String>(StorageKeys.homeTitle);

    return HomeInfoModel(
      title: storedTitle ?? 'Bienvenido a tu app base',
    );
  }

  Future<void> saveHomeTitle(String title) async {
    await storageService.write(StorageKeys.homeTitle, title);
  }
}