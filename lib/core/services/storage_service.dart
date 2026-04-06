import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage _box;

  StorageService(this._box);

  T? read<T>(String key) {
    return _box.read<T>(key);
  }

  Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  Future<void> remove(String key) async {
    await _box.remove(key);
  }
}