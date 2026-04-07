class HomeInfoModel {
  final String title;
  final int totalTasks;
  final int pendingTasks;
  final int completedTasks;

  HomeInfoModel({
    required this.title,
    required this.totalTasks,
    required this.pendingTasks,
    required this.completedTasks,
  });

  factory HomeInfoModel.fromMap(Map<String, dynamic> map) {
    return HomeInfoModel(
      title: map['title'] ?? '',
      totalTasks: map['totalTasks'] ?? 0,
      pendingTasks: map['pendingTasks'] ?? 0,
      completedTasks: map['completedTasks'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'totalTasks': totalTasks,
      'pendingTasks': pendingTasks,
      'completedTasks': completedTasks,
    };
  }

  HomeInfoModel copyWith({
    String? title,
    int? totalTasks,
    int? pendingTasks,
    int? completedTasks,
  }) {
    return HomeInfoModel(
      title: title ?? this.title,
      totalTasks: totalTasks ?? this.totalTasks,
      pendingTasks: pendingTasks ?? this.pendingTasks,
      completedTasks: completedTasks ?? this.completedTasks,
    );
  }
}