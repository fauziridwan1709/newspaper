import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newspaper/core/environments/endpoints.dart';
import 'package:newspaper/core/environments/flavor.dart';
import 'package:newspaper/services/shared_preferences_service.dart';

class Config {
  static Flavor? appFlavor;
  static String? appName;
  static String? packageName;

  /// Asset code base if any different app.
  static String? assetsPath;
  static String? imagesPath;
  static String? iconsPath;

  /// Initialize Config.
  static Future<void> init(
    Flavor flavor,
  ) async {
    appFlavor = flavor;
    appName = flavor.name;
    assetsPath = baseConfig.assetAbsolutePath;
    imagesPath = '${assetsPath!}/images';
    iconsPath = '${assetsPath!}/icons';

    // TODO(Any): uncomment for firebase.
    // await Firebase.initializeApp();

    /// Initialization of all services.
    await SharedPreferencesService.init();
    if (kDebugMode && !kIsWeb) {
      // await FirebaseCrashlytics.instance
      // .setCrashlyticsCollectionEnabled(false);
      // TODO(any): crash
      // FirebaseCrashlytics.instance.crash();
    }

    /// Initialize Future variables.

    /// Initialize SystemUI.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
  }

  static bool get isDevelopment => appFlavor == Flavor.development;
  static bool get isStaging => appFlavor == Flavor.staging;
  static bool get isProduction => appFlavor == Flavor.production;
  static BaseConfig get baseConfig => _baseConfig()!;

  static BaseConfig? _baseConfig() {
    switch (appFlavor) {
      case Flavor.development:
        return const BaseConfig(
          baseUrl: Endpoints.baseDevUrl,
          baseOtherServiceUrl: Endpoints.baseDevUrl,
        );
      case Flavor.staging:
        return const BaseConfig(
          baseUrl: Endpoints.baseStgUrl,
          baseOtherServiceUrl: Endpoints.baseStgUrl,
        );
      case Flavor.production:
        return const BaseConfig(
          baseUrl: Endpoints.basePrdUrl,
          baseOtherServiceUrl: Endpoints.basePrdUrl,
        );
      case null:
        throw UnimplementedError();
    }
  }
}

class BaseConfig {
  const BaseConfig({
    this.assetAbsolutePath = 'assets',
    required this.baseUrl,
    required this.baseOtherServiceUrl,
  });

  final String assetAbsolutePath;
  final String baseUrl;
  final String baseOtherServiceUrl;
}
