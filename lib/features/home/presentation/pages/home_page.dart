import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/dashboard_card.dart';
import '../../../../core/widgets/section_title.dart';
import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo Pro'),
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
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Organiza tu día, visualiza tu avance y mantén el control de tus tareas.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    FilledButton.icon(
                      onPressed: () async {
                        await Get.toNamed(AppRoutes.tasks);
                        controller.refreshDashboard();
                      },
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Abrir tareas'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              const SectionTitle(title: 'Resumen general'),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      label: 'Total',
                      value: info.totalTasks.toString(),
                      icon: Icons.list_alt,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: DashboardCard(
                      label: 'Pendientes',
                      value: info.pendingTasks.toString(),
                      icon: Icons.schedule,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              DashboardCard(
                label: 'Completadas',
                value: info.completedTasks.toString(),
                icon: Icons.task_alt,
              ),
              const SizedBox(height: AppSpacing.xxl),
              const SectionTitle(title: 'Personalización'),
              const SizedBox(height: AppSpacing.md),
              TextField(
                controller: controller.titleTextController,
                decoration: const InputDecoration(
                  labelText: 'Cambiar título principal',
                  hintText: 'Ej: Mi panel de productividad',
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: controller.updateTitle,
                  child: const Text('Guardar título'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}