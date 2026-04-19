import '../../../../core/constants/storage_keys.dart';
import '../../../../core/services/storage_service.dart';
import '../../../tasks/data/models/task_model.dart';
import '../models/home_info_model.dart';

class HomeLocalDataSource {
  final StorageService storageService;

  HomeLocalDataSource(this.storageService);

  Future<HomeInfoModel> getHomeInfo() async {
    final storedTitle = storageService.read<String>(StorageKeys.homeTitle);
    final storedTasks = storageService.read<List>(StorageKeys.tasks) ?? [];

    final tasks = storedTasks
        .map((item) => TaskModel.fromMap(Map<String, dynamic>.from(item)))
        .toList();

    final totalTasks = tasks.length;
    final completedTasks = tasks.where((task) => task.isCompleted).length;
    final pendingTasks = tasks.where((task) => !task.isCompleted).length;

    return HomeInfoModel(
      title: storedTitle ?? 'Bienvenido a ToDo Pro',
      totalTasks: totalTasks,
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
    );
  }

  Future<void> saveHomeTitle(String title) async {
    await storageService.write(StorageKeys.homeTitle, title);
  }
}