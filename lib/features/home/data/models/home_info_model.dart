class HomeInfoModel {
  final String title;

  HomeInfoModel({
    required this.title,
  });

  factory HomeInfoModel.fromMap(Map<String, dynamic> map) {
    return HomeInfoModel(
      title: map['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  HomeInfoModel copyWith({
    String? title,
  }) {
    return HomeInfoModel(
      title: title ?? this.title,
    );
  }
}