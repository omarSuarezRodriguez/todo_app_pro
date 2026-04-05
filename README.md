# todo_app_pro
Una App ToDo 


# Funciones:
- Crear tareas
- Listar tareas
- Marcar como completada
- Eliminar tarea
- Editar tarea
- Filtrar: Todas, pendientes, completadas
- Persistencia local con GetStorage
- Estado vacio
- Diseño limpio


# Stack de desarrollo
- Flutter
- GetX (Gestor de estados)
- GetStorage (Persistencia datos)
- Feature First (Orden de la App), agrupando por módulos
- Presentation/data (Estructura interna App)
- Core (Estructura Interna app)


# Arquitectura a usar
lib/
  app/
  core/
  features/
    home/
        presentation/
        data/
    tasks/
      presentation/
      data/


# Estructura inicial
lib/
│
├── main.dart
│
├── app/
│   ├── bindings/
│   │   └── initial_binding.dart
│   └── routes/
│       ├── app_pages.dart
│       └── app_routes.dart
│
├── core/
│   ├── constants/
│   │   └── storage_keys.dart
│   ├── services/
│   │   └── storage_service.dart
│   ├── theme/
│   │   └── app_theme.dart
│   ├── utils/
│   └── widgets/
│
└── features/
    └── home/
        ├── presentation/
        │   ├── bindings/
        │   │   └── home_binding.dart
        │   ├── controllers/
        │   │   └── home_controller.dart
        │   ├── pages/
        │   │   └── home_page.dart
        │   └── widgets/
        │
        └── data/
            ├── datasources/
            │   └── home_local_data_source.dart
            ├── models/
            │   └── home_info_model.dart
            └── repositories/
                └── home_repository.dart
    └── tasks/
        ├── presentation/
        │   ├── bindings/
        │   │   └── tasks_binding.dart
        │   ├── controllers/
        │   │   └── tasks_controller.dart
        │   ├── pages/
        │   │   └── tasks_page.dart
        │   └── widgets/
        │       ├── task_input_dialog.dart
        │       └── task_tile.dart
        │
        └── data/
            ├── datasources/
            │   └── tasks_local_data_source.dart
            ├── models/
            │   └── task_model.dart
            └── repositories/
                └── tasks_repository.dart