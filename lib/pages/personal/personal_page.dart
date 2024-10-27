import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid/pages/auth/login_page.dart';
import 'package:wanandroid/pages/personal/personal_vm.dart';
import 'package:wanandroid/pages/tab_page.dart';
import 'package:wanandroid/route/RouteUtils.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  PersonalVm vm = PersonalVm();

  @override
  void initState() {
    vm.refreshPersonalVm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ChangeNotifierProvider(
      create: (context) => vm,
      child: Column(
        children: [
          _header(() {
            RouteUtils.push(context, const LoginPage(), {});
          }),
          _settingsItem("我的收藏"),
          _settingsItem("检查更新"),
          _settingsItem("关于我们"),
          Consumer<PersonalVm>(builder: (context, vm, child) {
            return vm.logined ? _settingsItem("退出登录") : const SizedBox();
          })
        ],
      ),
    )));
  }

  _header(GestureDoubleTapCallback? onTap) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      width: double.infinity,
      height: 200.h,
      child: Consumer<PersonalVm>(builder: (context, vm, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (!vm.logined) {
                  onTap!();
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(35.r)),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 70.r,
                  height: 70,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            GestureDetector(
                onTap: () {
                  if (!vm.logined) {
                    onTap!();
                  }
                },
                child: Text(
                  vm.username ?? "登录中",
                  style: TextStyle(color: Colors.white, fontSize: 13.sp),
                ))
          ],
        );
      }),
    );
  }

  _settingsItem(String? title) {
    return GestureDetector(
      onTap: () {
        print("点击了$title");
        if (title == "退出登录") {
          vm.logout().then((onvalue) {
            RouteUtils.pushAndRemoveUntil(context, const TabPage());
          });
        }
      },
      child: Container(
        width: double.infinity,
        height: 50.h,
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 0.5.r),
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? "",
              style: TextStyle(fontSize: 16.sp),
            ),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
