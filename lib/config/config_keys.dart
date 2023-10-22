enum ConfigKeys { apiKey, teamId }

extension ConfigKeyValues on ConfigKeys {
  String getKeyValue() {
    switch (this) {
      case ConfigKeys.apiKey:
        return 'API_KEY';
      case ConfigKeys.teamId:
        return 'TEAM_ID';
    }
  }
}
