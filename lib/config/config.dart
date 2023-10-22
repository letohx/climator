import "package:flutter_dotenv/flutter_dotenv.dart";

import "config_keys.dart";

abstract class Config {
  static Config manager = ConfigImpl();
  String get(ConfigKeys key, {String? fallback});
  void initConfig(String env);
}

class ConfigImpl implements Config {
  @override
  String get(ConfigKeys key, {String? fallback}) {
    return dotenv.get(key.getKeyValue(), fallback: fallback);
  }

  @override
  Future<void> initConfig(String env) async {
    assert(env.isNotEmpty, "Application cannot start without valid env");
    dotenv.load(fileName: "$env.env");
  }
}
