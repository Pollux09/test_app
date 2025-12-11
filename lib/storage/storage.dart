import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  final SharedPreferences storage;

  Storage({required this.storage});

  Future<void> setSub() async {
    await storage.setBool("hasSub", true);
  }

  bool hasSub() {
    return storage.getBool("hasSub") ?? false;
  }
}