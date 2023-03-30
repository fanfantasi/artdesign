import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Trans;

import '../../core/config/constants.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<String> iconList = [
    'assets/icons/ic-home.png',
    'assets/icons/ic-bookmark.png',
    'assets/icons/ic-menus.png',
    'assets/icons/ic-events.png',
    'assets/icons/ic-user.png',
  ];

  final List<String> textList = [
    "Home",
    "favorite".tr(),
    "menu".tr(),
    "events".tr(),
    "account".tr()
  ];

  var timer = 0;
  void onMenuTapped(index) {
    if (index == 2) {
      scaffoldKey.currentState!.openDrawer();
    } else {
      selectedIndex.value = index;
    }
  }

  Future<bool> onWillPop() async {
    if (selectedIndex.value != 0) {
      onMenuTapped(0);
      timer = 0;
    } else {
      timer = timer + 1;
      if (timer < 2) {
        Fluttertoast.showToast(
            msg: "Tap again to exit",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Constants.appThemeColor.withOpacity(.4),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        return true;
      }
    }
    // ignore: null_check_always_fails
    return null!;
  }
}
