import 'package:get/get.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../../data/models/task_model.dart';
import '../../data/repositories/tasks_repository.dart';

enum TaskFilter {
  all,
  pending,
  completed,
}

class TasksController extends GetxController {
  final TasksRepository repository;

  TasksController(this.repository);

  final tasks = <TaskModel>[].obs;
  final isLoading = false.obs;
  final selectedFilter = TaskFilter.all.obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  Future<void> loadTasks() async {
    try {
      isLoading.value = true;
      final data = await repository.getTasks();
      tasks.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveTasks() async {
    await repository.saveTasks(tasks.toList());
  }

  Future<void> addTask(String title) async {
    final trimmedTitle = title.trim();

    if (trimmedTitle.isEmpty) return;

    final newTask = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: trimmedTitle,
      isCompleted: false,
    );

    tasks.add(newTask);
    await saveTasks();

    AppSnackbar.success(
      title: 'Tarea creada',
      message: 'La tarea se agregó correctamente.',
    );
  }

  Future<void> updateTask(String id, String newTitle) async {
    final trimmedTitle = newTitle.trim();

    if (trimmedTitle.isEmpty) return;

    final index = tasks.indexWhere((task) => task.id == id);

    if (index == -1) return;

    tasks[index] = tasks[index].copyWith(title: trimmedTitle);
    tasks.refresh();
    await saveTasks();

    AppSnackbar.success(
      title: 'Tarea actualizada',
      message: 'Los cambios se guardaron correctamente.',
    );
  }

  Future<void> toggleTask(TaskModel task) async {
    final index = tasks.indexWhere((item) => item.id == task.id);

    if (index == -1) return;

    final updatedTask = task.copyWith(
      isCompleted: !task.isCompleted,
    );

    tasks[index] = updatedTask;
    tasks.refresh();
    await saveTasks();

    AppSnackbar.info(
      title: updatedTask.isCompleted ? 'Completada' : 'Pendiente',
      message: updatedTask.isCompleted
          ? 'La tarea fue marcada como completada.'
          : 'La tarea volvió a pendientes.',
    );
  }

  Future<void> deleteTask(String id) async {
    tasks.removeWhere((task) => task.id == id);
    await saveTasks();

    AppSnackbar.success(
      title: 'Tarea eliminada',
      message: 'La tarea se eliminó correctamente.',
    );
  }

  void changeFilter(TaskFilter filter) {
    selectedFilter.value = filter;
  }

  List<TaskModel> get filteredTasks {
    switch (selectedFilter.value) {
      case TaskFilter.pending:
        return tasks.where((task) => !task.isCompleted).toList();
      case TaskFilter.completed:
        return tasks.where((task) => task.isCompleted).toList();
      case TaskFilter.all:
        return tasks;
    }
  }

  int get totalTasks => tasks.length;

  int get completedTasksCount =>
      tasks.where((task) => task.isCompleted).length;

  int get pendingTasksCount =>
      tasks.where((task) => !task.isCompleted).length;
}