import 'package:flutter/material.dart';
import 'package:wanandroid/repository/api.dart';
import 'package:wanandroid/utils/constants.dart';
import 'package:wanandroid/utils/sp_utils.dart';

class PersonalVm with ChangeNotifier {
  String? username;
  bool logined = false;
  Future refreshPersonalVm() async {
    String? username = await SpUtils.getString(Constants.SP_USER_NAME);
    if (username != null && username.isNotEmpty) {
      this.username = username;
      logined = true;
      notifyListeners();
    } else {
      this.username = "未登录";
      logined = false;
      notifyListeners();
    }
  }

  // 退出登录
  Future logout() async {
    bool? success = await Api.instance.logout();
    if (success ?? false) {
      await SpUtils.removeAll();
      await refreshPersonalVm();
    }
  }
}
