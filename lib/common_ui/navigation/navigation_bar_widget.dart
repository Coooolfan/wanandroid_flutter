import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wanandroid/common_ui/navigation/navigation_bar_item.dart';

class NavigationBarWidget extends StatefulWidget {
  NavigationBarWidget({
    super.key,
    required this.pages,
    required this.labels,
    required this.icons,
    required this.activeIcons,
    this.onTabChanged,
    this.initialIndex = 0,
  }) {
    if (pages.length != labels.length ||
        pages.length != icons.length ||
        pages.length != activeIcons.length) {
      throw Exception(
          'The length of pages, labels, icons and activeIcons must be the same');
    }
  }

  final List<Widget> pages;
  final List<String> labels;
  final List<Widget> icons;
  final List<Widget> activeIcons;
  final ValueChanged<int>? onTabChanged;
  final int initialIndex;

  @override
  State createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: currentIndex,
          children: widget.pages,
        )),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  TextStyle(fontSize: 12.sp, color: Colors.blueGrey),
              currentIndex: currentIndex,
              items: _buildBottomNavigationBarItems(),
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
                if (widget.onTabChanged != null) {
                  widget.onTabChanged?.call(value);
                }
              },
            )));
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    final List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < widget.pages.length; i++) {
      items.add(BottomNavigationBarItem(
          icon: widget.icons[i],
          activeIcon: NavigationBarItem(builder: (context) {
            return widget.activeIcons[i];
          }),
          label: widget.labels[i]));
    }
    return items;
  }
}
