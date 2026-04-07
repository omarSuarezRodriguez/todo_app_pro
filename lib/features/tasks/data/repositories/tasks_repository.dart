import '../datasources/tasks_local_data_source.dart';
import '../models/task_model.dart';

class TasksRepository {
  final TasksLocalDataSource localDataSource;

  TasksRepository(this.localDataSource);

  Future<List<TaskModel>> getTasks() async {
    return await localDataSource.getTasks();
  }

  Future<void> saveTasks(List<TaskModel> tasks) async {
    await localDataSource.saveTasks(tasks);
  }
}