import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextField commonIput(String? type, TextEditingController? controller) {
  return TextField(
    controller: controller,
    style: TextStyle(color: Colors.white, fontSize: 14.sp),
    cursorColor: Colors.white,
    decoration: InputDecoration(
        labelText: type ?? "请输入",
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.r)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.5.r))),
  );
}
