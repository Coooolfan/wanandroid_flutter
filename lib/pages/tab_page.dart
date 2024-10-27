import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wanandroid/common_ui/navigation/navigation_bar_widget.dart';
import 'package:wanandroid/pages/home/home_page.dart';
import 'package:wanandroid/pages/hot_key/hot_key_page.dart';
import 'package:wanandroid/pages/knowledge/knowledge_page.dart';
import 'package:wanandroid/pages/personal/personal_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  late List<Widget> pages;
  late List<String> labels;
  late List<Widget> icons;
  late List<Widget> activeIcons;
  @override
  void initState() {
    super.initState();
    pages = <Widget>[
      const HomePage(),
      const HotKeyPage(),
      const KnowledgePage(),
      const PersonalPage(),
    ];
    labels = <String>['首页', '热点', '体系', '我的'];
    icons = <Widget>[
      Image.asset('assets/images/icon_home_grey.png',
          width: 32.r, height: 32.r),
      Image.asset('assets/images/icon_hot_key_grey.png',
          width: 32.r, height: 32.r),
      Image.asset('assets/images/icon_knowledge_grey.png',
          width: 32.r, height: 32.r),
      Image.asset('assets/images/icon_personal_grey.png',
          width: 32.r, height: 32.r),
    ];
    activeIcons = <Widget>[
      Image.asset('assets/images/icon_home_selected.png',
          width: 32.r, height: 32.r),
      Image.asset('assets/images/icon_hot_key_selected.png',
          width: 32.r, height: 32.r),
      Image.asset('assets/images/icon_knowledge_selected.png',
          width: 32.r, height: 32.r),
      Image.asset('assets/images/icon_personal_selected.png',
          width: 32.r, height: 32.r),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarWidget(
      pages: pages,
      labels: labels,
      icons: icons,
      activeIcons: activeIcons,
      initialIndex: 0,
      onTabChanged: (int index) {
        print('index: $index');
      },
    );
  }
}
