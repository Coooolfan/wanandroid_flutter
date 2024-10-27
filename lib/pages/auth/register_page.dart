import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid/common_ui/common_style.dart';
import 'package:wanandroid/pages/auth/auth_vm.dart';
import 'package:wanandroid/route/RouteUtils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  AuthVm vm = AuthVm();
  TextEditingController? accountController;
  TextEditingController? passwordController;
  TextEditingController? rePasswordController;
  @override
  void initState() {
    super.initState();
    accountController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
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
              SizedBox(height: 20.h),
              commonIput("重复密码", rePasswordController),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 40.w, right: 40.w),
                width: double.infinity,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: () {
                    vm
                        .register(
                            accountController?.text ?? '',
                            passwordController?.text ?? '',
                            rePasswordController?.text ?? '')
                        .then((onValue) {
                      if (onValue == true) {
                        showToast("注册成功");
                        RouteUtils.pop(context);
                      }
                    });
                  },
                  child:
                      const Text("注册", style: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ));
  }
}
