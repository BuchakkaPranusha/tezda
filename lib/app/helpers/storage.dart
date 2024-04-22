import 'package:get_storage/get_storage.dart';

class Storage {
  static var storage = GetStorage();

  static writeString(String key, String value) {
    storage.write(key, value);
  }

  static String readString(String key) {
    if (storage.hasData(key)) {
      return storage.read(key);
    }
    return "null";
  }

  static writeDynamic(dynamic key, dynamic value) {
    storage.write(key, value);
  }

  static dynamic readDynamic(String key) {
    if (storage.hasData(key)) {
      return storage.read(key);
    }
    return null;
  }

  static writeInt(String key, int value) {
    storage.write(key, value);
  }

  static int readInt(String key) {
    if (storage.hasData(key)) {
      return storage.read(key);
    }
    return -1;
  }

  static writeBoolean(String key, bool value) {
    storage.write(key, value);
  }

  static bool readBoolean(String key) {
    if (storage.hasData(key)) {
      return storage.read(key);
    }
    return false;
  }

  static remove(String key) {
    if (storage.hasData(key)) {
      storage.remove(key);
    }
  }

  static clearAllData() {
    int PermissionsGave = Storage.readInt("PermissionGave");
    storage.erase();
    Storage.writeInt("PermissionGave", PermissionsGave);
    // setOnBoarding(true);
  }
}
