import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid/pages/hot_key/hot_key_vm.dart';
import 'package:wanandroid/pages/search/search_page.dart';
import 'package:wanandroid/route/RouteUtils.dart';

class HotKeyPage extends StatefulWidget {
  const HotKeyPage({super.key});

  @override
  State createState() => _HotKeyPageState();
}

class _HotKeyPageState extends State<HotKeyPage> {
  HotKeyVM vm = HotKeyVM();
  @override
  void initState() {
    super.initState();
    vm.initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return vm;
      },
      child: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
        child: Column(
          children: [
            // 标题
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.5.r, color: Colors.grey))),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Row(
                  children: [
                    const Text("搜索热词", style: TextStyle(fontSize: 20)),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () =>
                          RouteUtils.push(context, const SearchPage(), {}),
                      child: Image.asset(
                        "assets/images/icon_search.png",
                        width: 30.r,
                        height: 30.r,
                      ),
                    )
                  ],
                )),
            // 搜索热词
            _hotKeyGrid(),
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.5.r, color: Colors.grey))),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: const Row(
                  children: [
                    Text("常用网站", style: TextStyle(fontSize: 20)),
                    Expanded(child: SizedBox())
                  ],
                )),
            _commonWebsiteGrid()
          ],
        ),
      ))),
    );
  }

  _hotKeyGrid() {
    return Consumer<HotKeyVM>(builder: (context, vm, child) {
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 10.r,
              maxCrossAxisExtent: 120.w,
              crossAxisSpacing: 10.r,
              childAspectRatio: 3),
          itemBuilder: (context, index) {
            var item = vm.searchHotKeyList?[index].name ?? "";
            return GestureDetector(
              onTap: () => RouteUtils.push(
                context,
                SearchPage(
                  keyword: item,
                ),
                {},
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5.r),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Text(item),
              ),
            );
          },
          itemCount: vm.searchHotKeyList?.length ?? 0,
        ),
      );
    });
  }

  _commonWebsiteGrid() {
    return Consumer<HotKeyVM>(builder: (context, vm, child) {
      return Container(
        padding: const EdgeInsets.only(bottom: 20),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 10.r,
              maxCrossAxisExtent: 120.w,
              crossAxisSpacing: 10.r,
              childAspectRatio: 3),
          itemBuilder: (context, index) {
            var item = vm.commonWebsiteList?[index].name ?? "";
            return GestureDetector(
              onTap: () {
                RouteUtils.push(
                  context,
                  SearchPage(
                    keyword: item,
                  ),
                  {},
                );
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5.r),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Text(item),
              ),
            );
          },
          itemCount: vm.commonWebsiteList?.length ?? 0,
        ),
      );
    });
  }
}
