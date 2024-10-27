import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid/pages/knowledge/detail/knowledge_detail_tab_vm.dart';
import 'package:wanandroid/repository/datas/knowledge_detail_data.dart';
import 'package:wanandroid/route/routes.dart';

class KnowledgeDetailTabChildPage extends StatefulWidget {
  final String cid;

  const KnowledgeDetailTabChildPage(this.cid, {super.key});

  @override
  State createState() {
    return _KnowledgeDetailTabChildPageState();
  }
}

class _KnowledgeDetailTabChildPageState
    extends State<KnowledgeDetailTabChildPage> {
  KnowledgeDetailTabVm vm = KnowledgeDetailTabVm();
  RefreshController refreshController = RefreshController();
  @override
  void initState() {
    super.initState();
    refreshOrLoadMore(false);
  }

  void refreshOrLoadMore(bool loadMore) {
    vm.getKnowledgeDetailList(widget.cid, loadMore).then((onValue) {
      if (loadMore) {
        refreshController.loadComplete();
      } else {
        refreshController.refreshCompleted();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => vm,
        child: Scaffold(
          body: Consumer<KnowledgeDetailTabVm>(builder: (context, vm, child) {
            return SmartRefresher(
              enablePullUp: true,
              enablePullDown: true,
              header: const ClassicHeader(),
              footer: const ClassicFooter(),
              controller: refreshController,
              onRefresh: () => refreshOrLoadMore(false),
              onLoading: () => refreshOrLoadMore(true),
              child: ListView.builder(
                  itemCount: vm.knowledgeDetailList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return _listItem(vm.knowledgeDetailList![index]);
                  }),
            );
          }),
        ));
  }

  Widget _listItem(KnowledgeDetailItem data) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.only(left: 10.r, right: 10.r, top: 5.r, bottom: 5.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.black12, width: 0.5.r)),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                    "https://zhifengmuxue.top/img/1.jpg",
                    width: 30.r,
                    height: 30.r,
                  )),
              SizedBox(width: 5.r),
              Text(
                  (data.author?.isEmpty ?? true)
                      ? (data.shareUser ?? "作者缺省")
                      : (data.author ?? "作者缺省"),
                  style: const TextStyle(color: Colors.black)),
              SizedBox(width: 5.r),
              Text(
                data.niceDate ?? "",
                style: const TextStyle(fontSize: 10),
              ),
              const Expanded(child: SizedBox())
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutePath.webViewPage,
                  arguments: {"title": data.title ?? "标题缺省"});
            },
            child: Container(
                padding: EdgeInsets.only(top: 10.r, bottom: 10.r),
                width: double.infinity,
                child: Text(
                  data.title ?? "标题缺省",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.superChapterName ?? "tag缺省",
                style: const TextStyle(fontSize: 10, color: Colors.blue),
              ),
              GestureDetector(
                child: Image.asset(
                  data.collect ?? false
                      ? "assets/images/img_collect.png"
                      : "assets/images/img_collect_grey.png",
                  width: 20.r,
                  height: 20.r,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
