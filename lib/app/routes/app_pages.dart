import 'package:get/get.dart';

import '../../features/home/presentation/bindings/home_binding.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/tasks/presentation/bindings/tasks_binding.dart';
import '../../features/tasks/presentation/pages/tasks_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.tasks,
      page: () => const TasksPage(),
      binding: TasksBinding(),
    ),
  ];
}