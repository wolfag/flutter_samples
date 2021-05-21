import 'dart:collection';
import 'dart:ui';
import 'package:get/get.dart';

import 'package:get/route_manager.dart';
import 'package:getx_demo/i18n/st_en_us.dart';
import 'package:getx_demo/i18n/st_vi_vn.dart';

class LocalizationService extends Translations {
  static final locale = _getLocaleFromLanguage();
  static final fallbackLocale = Locale('en', 'US');

  static final langCodes = ['en', 'vi'];

  static final locales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];

  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
      };

  static Locale _getLocaleFromLanguage({String langCode}) {
    var lang = langCode ?? Get.deviceLocale.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) {
        return locales[i];
      }
    }
    return Get.locale;
  }
}
