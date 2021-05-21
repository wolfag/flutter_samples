import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  bool isShowingDialog = false;

  @override
  void onInit() async {
    super.onInit();
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      isShowingDialog = true;
      showDialog();
    }

    Connectivity().onConnectivityChanged.listen(
      (event) {
        if (event == ConnectivityResult.none) {
          isShowingDialog = true;
          showDialog();
        } else {
          if (isShowingDialog) {
            Get.back();
            isShowingDialog = false;
          }
        }
      },
    );
  }

  void showDialog() {
    Get.dialog(
      AlertDialog(
        title: Text(
            'please_turn_on_network_connection_to_continue_using_this_app.'.tr),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
