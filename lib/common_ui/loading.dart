import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

class Loading {
  // 私有构造方法，防止被实例化
  Loading._();
  static Future showLoading() async {
    showToastWidget(
        Container(
          color: Colors.transparent,
          constraints: const BoxConstraints.expand(),
          child: Align(
            child: Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: CircularProgressIndicator(
                strokeWidth: 2.w,
                valueColor: const AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
        ),
        handleTouch: true,
        duration: const Duration(days: 1));
  }

  static void hideLoading() {
    dismissAllToast();
  }
}
