import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid/pages/knowledge/detail/knowledge_detail_tab_page.dart';
import 'package:wanandroid/pages/knowledge/knowledge_vm.dart';
import 'package:wanandroid/repository/datas/knowledge_data.dart';
import 'package:wanandroid/route/RouteUtils.dart';

class KnowledgePage extends StatefulWidget {
  const KnowledgePage({super.key});

  @override
  State createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State<KnowledgePage> {
  KnowledgeVm vm = KnowledgeVm();

  @override
  void initState() {
    super.initState();
    vm.getWebsiteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ChangeNotifierProvider(
      create: (context) {
        return vm;
      },
      child: Consumer<KnowledgeVm>(builder: (context, vm, child) {
        return Container(
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h, bottom: 10.h),
          child: ListView.builder(
              itemCount: vm.knowledgeList?.length ?? 0,
              itemBuilder: (context, index) {
                return _listItem(vm.knowledgeList![index]);
              }),
        );
      }),
    )));
  }

  _listItem(KnowledgeData data) {
    return GestureDetector(
      onTap: () {
        RouteUtils.push(context,
            KnowledgeDetailTabPage(tabList: data.knowledgeChildren), {});
      },
      child: Container(
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
        margin: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 0.5.r),
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name ?? "",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  Text(data.knowledgeChildrenNameListString,
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey))
                ],
              ),
            ),
            Image.asset("assets/images/img_arrow_right.png",
                width: 15.w, height: 20.h)
          ],
        ),
      ),
    );
  }
}
