enum ConfigKeys {
  apiKey
}

extension ConfigKeyValues on ConfigKeys {
  String getKeyValue() {
    switch (this) {
      case ConfigKeys.apiKey:
        return "API_KEY";
    }
  }
}
