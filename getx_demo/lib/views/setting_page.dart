import 'package:flutter/material.dart';
import 'package:getx_demo/i18n/localization_service.dart';
import 'package:get/get.dart';

class SettingPage extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setting'.tr),
      ),
      body: Container(
        child: Center(
          child: DropdownButton<String>(
            icon: Icon(Icons.arrow_drop_down),
            value: Get.locale.languageCode,
            items: _buildDropdownMenuItem(),
            onChanged: (String value) {
              LocalizationService.changeLocale(value);
            },
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownMenuItem() {
    List<DropdownMenuItem<String>> list = [];
    LocalizationService.langs.forEach(
      (key, value) {
        list.add(
          DropdownMenuItem<String>(
            value: key,
            child: Text(key),
          ),
        );
      },
    );
    return list;
  }
}
