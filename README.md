# todo_app_pro

Aplicación Flutter de gestión de tareas desarrollada con GetX, arquitectura Feature First, separación en capas presentation/data, persistencia local con GetStorage y componentes reutilizables en core. Incluye CRUD completo, filtros, dashboard de resumen y feedback visual al usuario.


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



                # 📝 ToDo Pro

Aplicación móvil desarrollada en Flutter para la gestión de tareas, enfocada en buenas prácticas de arquitectura, organización modular y experiencia de usuario.

---

## 🚀 Demo

> Puedes agregar aquí:
- GIF de la app
- Screenshots
- Link a video

---

## 📱 Características

- Crear tareas
- Editar tareas
- Eliminar tareas (con confirmación)
- Marcar tareas como completadas
- Filtros:
  - Todas
  - Pendientes
  - Completadas
- Persistencia local
- Dashboard con resumen de tareas
- Feedback visual con snackbars
- Validaciones de entrada

---

## 🧠 Arquitectura

El proyecto está construido usando:

- **Flutter**
- **GetX**
- **GetStorage**
- **Feature First Architecture**
- Separación en capas:
  - `presentation`
  - `data`
- `core` para elementos reutilizables

### 📁 Estructura del proyecto

lib/
├── app/ # Rutas y bindings globales
├── core/ # Elementos reutilizables
│ ├── constants/
│ ├── theme/
│ └── widgets/
├── features/
│ ├── home/
│ └── tasks/




## 🔁 Flujo de la aplicación


UI → Controller → Repository → DataSource → StorageService → GetStorag


- UI: Widgets y pantallas
- Controller: lógica de presentación
- Repository: capa de abstracción
- DataSource: acceso a datos
- StorageService: wrapper de GetStorage

---

## 💾 Persistencia

Se utiliza **GetStorage** para almacenamiento local, encapsulado mediante un servicio (`StorageService`) para desacoplar la lógica de la librería externa.

---

## 🎨 UI / UX

- Material 3
- Componentes reutilizables
- Feedback visual con snackbars
- Estados vacíos personalizados
- Confirmación antes de acciones destructivas
- Diseño limpio y consistente

---

## 📦 Dependencias principales

```yaml
get: ^4.x.x
get_storage: ^2.x.x



Buenas prácticas aplicadas
Separación de responsabilidades
Modularización por features
Uso de bindings con GetX
Reutilización de widgets en core
Eliminación de lógica directa en UI
Desacoplamiento mediante servicios (wrapper)




🎯 Objetivo del proyecto

Este proyecto fue desarrollado como parte de un proceso de aprendizaje enfocado en:

Arquitectura limpia simplificada
Organización escalable de proyectos Flutter
Desarrollo de aplicaciones mantenibles
Preparación para proyectos de nivel profesional







📌 Próximas mejoras (opcional)
Autenticación de usuario
Sincronización con backend
Animaciones
Notificaciones





---

# 🧠 Consejos clave (esto es oro para portafolio)

Cuando subas esto a GitHub:

## 1. Agrega screenshots
- home
- tasks
- filtros
- empty state

## 2. Nombre del repo
Algo así: todo-pro-flutter-getx



## 3. Descripción corta del repo
Flutter ToDo App using GetX, Feature First Architecture and local persistence with GetStorage.



## 4. Topics (etiquetas en GitHub)
flutter
getx
clean-architecture
mobile-app
todo-app



---

# 🚀 Siguiente paso (muy importante)

Ahora tienes 2 caminos muy buenos:

## Opción 1 (portafolio fuerte)
Crear otra app usando ESTA MISMA BASE:
- gastos personales
- hábitos
- notas
- inventario simple

👉 ya no empiezas desde 0, solo reutilizas estructura

---

## Opción 2 (nivel profesional)
Hacer una versión 2 de esta app con:
- backend (Node / Firebase)
- login
- sincronización
- multi-device

---


# 🎯 Recomendación para ti

Yo haría esto:

👉 **App 2 usando esta misma base**

Porque:
- ya tienes la arquitectura
- ahora solo cambias la lógica
- subes rápido tu portafolio

---

Si quieres, en el siguiente paso te puedo armar:

👉 **tu siguiente proyecto completo (tipo app de gastos o hábitos) usando EXACTAMENTE esta base**

y ya vas a otro nivel 🚀
