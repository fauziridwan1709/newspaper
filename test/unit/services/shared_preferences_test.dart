import 'package:flutter_test/flutter_test.dart';
import 'package:newspaper/services/app_logger.dart';
import 'package:newspaper/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() {
    SharedPreferences.setMockInitialValues({});
    SharedPreferencesService.init();
  });

  group('Preferences Service test', () {
    test('saveBool & getBool test', () async {
      await SharedPreferencesService.saveBool('key', value: false);
      expect(SharedPreferencesService.getBool('key'), false);
    });

    test('saveBool & getBool test', () async {
      await SharedPreferencesService.saveInt('key', 1);
      expect(SharedPreferencesService.getInt('key'), 1);
    });

    test('containsKey & getStringList test', () async {
      expect(SharedPreferencesService.getStringList('nullKey'), null);
      expect(SharedPreferencesService.containsKey('nullKey'), false);
    });
    test('save & remove key test', () async {
      await SharedPreferencesService.saveString('mock', 'mockValue');
      await SharedPreferencesService.removeKey('mock');

      final mockValue = SharedPreferencesService.getString('mock');

      expect(mockValue, null);
    });

    test('save token & get headers test', () async {
      const tokenVal = 'mockValue';
      const contentTypeVal = 'application/json';
      const authorizationKey = 'Authorization';
      const contentTypeKey = 'Content-Type';
      await SharedPreferencesService.saveToken(tokenVal);
      final headers = SharedPreferencesService.getHeaders();

      expect(headers, isA<Map>());

      expect(headers.containsKey(authorizationKey), true);
      expect(headers[authorizationKey], isNotNull);
      expect(headers[authorizationKey], 'Token $tokenVal');

      expect(headers.containsKey(contentTypeKey), true);
      expect(headers[contentTypeKey], isNotNull);
      expect(headers[contentTypeKey], contentTypeVal);
    });

    test('test log', () async {
      AppLogger.v('data');
      AppLogger.w('data');
      AppLogger.e('data');
      AppLogger.wtf('data');
    });
  });
}
