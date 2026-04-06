import '../datasources/home_local_data_source.dart';
import '../models/home_info_model.dart';

class HomeRepository {
  final HomeLocalDataSource localDataSource;

  HomeRepository(this.localDataSource);

  Future<HomeInfoModel> getHomeInfo() async {
    return await localDataSource.getHomeInfo();
  }

  Future<void> saveHomeTitle(String title) async {
    await localDataSource.saveHomeTitle(title);
  }
}