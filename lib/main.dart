import 'package:climator/screens/get_started.dart';
import 'package:flutter/material.dart';

import 'config/config.dart';

void main() {
  startApp();
}

startApp() async {
  const env = String.fromEnvironment("ENV", defaultValue: "dev");
  Config.manager.initConfig(env);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: GetStarted(),
    );
  }
}
