import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid/route/RouteUtils.dart';
import 'package:wanandroid/route/routes.dart';

Size get designSize {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  final logicalShortestSide =
      firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  final logicalLongestSide =
      firstView.physicalSize.longestSide / firstView.devicePixelRatio;
  const scaleFactor = 0.95;
  return Size(
      logicalShortestSide * scaleFactor, logicalLongestSide * scaleFactor);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: ScreenUtilInit(
            designSize: designSize,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'WanAndroid',
                theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true),
                onGenerateRoute: Routes.onGenerateRoute,
                navigatorKey: RouteUtils.navigatorKey,
                initialRoute: RoutePath.tab,
              );
            }));
  }
}
