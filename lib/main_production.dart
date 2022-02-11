import 'package:flutter/material.dart';
import 'package:newspaper/app.dart';
import 'package:newspaper/core/environments/config.dart';
import 'package:newspaper/core/environments/flavor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.init(Flavor.production);
  const rootWidget = App();
  runApp(rootWidget);
}
