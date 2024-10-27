import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wanandroid/common_ui/common_style.dart';
import 'package:wanandroid/pages/auth/auth_vm.dart';
import 'package:wanandroid/pages/auth/register_page.dart';
import 'package:wanandroid/pages/tab_page.dart';
import 'package:wanandroid/route/RouteUtils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? accountController;
  TextEditingController? passwordController;
  AuthVm vm = AuthVm();

  @override
  void initState() {
    super.initState();
    accountController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              commonIput("账号", accountController),
              SizedBox(height: 20.h),
              commonIput("密码", passwordController),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 40.w, right: 40.w),
                width: double.infinity,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: () {
                    vm
                        .login(accountController?.text ?? '',
                            passwordController?.text ?? '')
                        .then((onValue) {
                      if (onValue == true) {
                        RouteUtils.pushAndRemoveUntil(context, const TabPage());
                      }
                    });
                  },
                  child:
                      const Text("登录", style: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40.w, right: 40.w),
                color: Colors.transparent,
                width: double.infinity,
                height: 40.h,
                child: TextButton(
                  onPressed: () {
                    RouteUtils.push(context, const RegisterPage(), {});
                  },
                  child:
                      const Text("前往注册", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ));
  }
}
