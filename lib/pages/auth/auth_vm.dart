import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid/repository/api.dart';
import 'package:wanandroid/utils/constants.dart';
import 'package:wanandroid/utils/sp_utils.dart';

class AuthVm with ChangeNotifier {
  Future<bool?> register(
    String account,
    String password,
    String rePassword,
  ) async {
    if (account.isEmpty || password.isEmpty || rePassword.isEmpty) {
      showToast("账号密码不能为空");
      return false;
    }
    if (password != rePassword) {
      showToast("两次密码不一致");
      return false;
    }
    if (password.length < 6) {
      showToast("密码长度不能小于6位");
      return false;
    }
    return await Api.instance.register(account, password, rePassword);
  }

  Future<bool?> login(String account, String password) async {
    if (account.isEmpty || password.isEmpty) {
      showToast("账号密码不能为空");
      return false;
    }
    var resp = await Api.instance.login(account, password);
    if (resp == null || resp.username == null || resp.username!.isEmpty) {
      return false;
    }
    SpUtils.saveString(Constants.SP_USER_NAME, resp.username ?? "");
    return true;
  }
}
