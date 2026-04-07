import '../../../../core/constants/storage_keys.dart';
import '../../../../core/services/storage_service.dart';
import '../models/task_model.dart';

class TasksLocalDataSource {
  final StorageService storageService;

  TasksLocalDataSource(this.storageService);

  Future<List<TaskModel>> getTasks() async {
    final storedTasks = storageService.read<List>(StorageKeys.tasks);

    if (storedTasks == null) return [];

    return storedTasks
        .map((item) => TaskModel.fromMap(Map<String, dynamic>.from(item)))
        .toList();
  }

  Future<void> saveTasks(List<TaskModel> tasks) async {
    final data = tasks.map((task) => task.toMap()).toList();
    await storageService.write(StorageKeys.tasks, data);
  }
}