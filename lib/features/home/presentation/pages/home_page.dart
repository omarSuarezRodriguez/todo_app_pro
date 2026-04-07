import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_routes.dart';
import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Base'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final info = controller.homeInfo.value;

        return RefreshIndicator(
          onRefresh: controller.refreshDashboard,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Organiza tu día y mantén el control de tus tareas.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Resumen general',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _DashboardCard(
                      label: 'Total',
                      value: info.totalTasks.toString(),
                      icon: Icons.list_alt,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _DashboardCard(
                      label: 'Pendientes',
                      value: info.pendingTasks.toString(),
                      icon: Icons.schedule,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _DashboardCard(
                label: 'Completadas',
                value: info.completedTasks.toString(),
                icon: Icons.task_alt,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: controller.titleTextController,
                decoration: const InputDecoration(
                  labelText: 'Cambiar título principal',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: controller.updateTitle,
                  child: const Text('Guardar título'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () async {
                    await Get.toNamed(AppRoutes.tasks);
                    controller.refreshDashboard();
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Ir a tareas'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _DashboardCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(label),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}