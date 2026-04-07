import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tasks_controller.dart';
import '../widgets/task_input_dialog.dart';
import '../widgets/task_tile.dart';
import '../widgets/delete_task_dialog.dart';

class TasksPage extends GetView<TasksController> {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tareas'), centerTitle: true),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          TaskInputDialog.show(
            title: 'Nueva tarea',
            onConfirm: (value) => controller.addTask(value),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Nueva'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final filteredTasks = controller.filteredTasks;

        return Column(
          children: [
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Resumen',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 8),
            _TasksSummary(controller: controller),
            const SizedBox(height: 12),
            _FilterSection(controller: controller),
            const SizedBox(height: 8),
            Expanded(
              child: filteredTasks.isEmpty
                  ? const _EmptyTasksState()
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 90),
                      itemCount: filteredTasks.length,
                      itemBuilder: (context, index) {
                        final task = filteredTasks[index];

                        return TaskTile(
                          task: task,
                          onToggle: () => controller.toggleTask(task),
                          onDelete: () {
                            DeleteTaskDialog.show(
                              taskTitle: task.title,
                              onConfirm: () => controller.deleteTask(task.id),
                            );
                          },
                          onEdit: () {
                            TaskInputDialog.show(
                              title: 'Editar tarea',
                              initialValue: task.title,
                              onConfirm: (value) {
                                controller.updateTask(task.id, value);
                              },
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        );
      }),
    );
  }
}

class _TasksSummary extends StatelessWidget {
  final TasksController controller;

  const _TasksSummary({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            // return Wrap(
              return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _SummaryItem(
                  label: 'Total',
                  value: controller.totalTasks.toString(),
                ),
                _SummaryItem(
                  label: 'Pendientes',
                  value: controller.pendingTasksCount.toString(),
                ),
                _SummaryItem(
                  label: 'Completadas',
                  value: controller.completedTasksCount.toString(),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}

class _FilterSection extends StatelessWidget {
  final TasksController controller;

  const _FilterSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            ChoiceChip(
              label: const Text('Todas'),
              selected: controller.selectedFilter.value == TaskFilter.all,
              onSelected: (_) => controller.changeFilter(TaskFilter.all),
            ),
            const SizedBox(width: 8),
            ChoiceChip(
              label: const Text('Pendientes'),
              selected: controller.selectedFilter.value == TaskFilter.pending,
              onSelected: (_) => controller.changeFilter(TaskFilter.pending),
            ),
            const SizedBox(width: 8),
            ChoiceChip(
              label: const Text('Completadas'),
              selected: controller.selectedFilter.value == TaskFilter.completed,
              onSelected: (_) => controller.changeFilter(TaskFilter.completed),
            ),
          ],
        ),
      );
    });
  }
}

class _EmptyTasksState extends StatelessWidget {
  const _EmptyTasksState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task_alt, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            const Text(
              'No hay tareas para mostrar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Agrega una nueva tarea o cambia el filtro actual.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
