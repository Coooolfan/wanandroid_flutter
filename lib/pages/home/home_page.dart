import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid/common_ui/web/webview_page.dart';
import 'package:wanandroid/common_ui/web/webview_widget.dart';
import 'package:wanandroid/repository/datas/home_list_data.dart';
import 'package:wanandroid/pages/home/home_vm.dart';
import 'package:wanandroid/route/RouteUtils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int pageCount = 0;
  HomeViewModel homeViewModel = HomeViewModel();
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    homeViewModel.getBanner();
    homeViewModel.getHomeList(false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
        create: (context) {
          return homeViewModel;
        },
        child: _buildView());
  }

  Widget _buildView() {
    return Scaffold(
        body: SafeArea(
      child: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        enablePullDown: true,
        header: const ClassicHeader(),
        footer: const ClassicFooter(),
        onLoading: () {
          homeViewModel.getBanner().then((value) {
            homeViewModel.getHomeList(true).then((value) {
              refreshController.loadComplete();
            });
          });
        },
        onRefresh: () {
          homeViewModel.getBanner().then((value) {
            homeViewModel.getHomeList(false).then((value) {
              refreshController.refreshCompleted();
            });
          });
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              _banner(),
              _listView(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _banner() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return SizedBox(
        width: double.infinity,
        height: 180.h,
        child: Swiper(
          indicatorLayout: PageIndicatorLayout.NONE,
          autoplay: true,
          itemCount: vm.bannerList?.length ?? 0,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(15.r),
              color: const Color.fromARGB(255, 230, 230, 230),
              child: Image.network(
                vm.bannerList?[index]?.imagePath ?? "",
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      );
    });
  }

  Widget _listView() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: vm.listData?.length ?? 0,
          itemBuilder: (context, index) {
            return _listItemView(vm.listData?[index], index);
          });
    });
  }

  Widget _listItemView(HomeListItemData? data, int index) {
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
                  (data?.author?.isEmpty ?? true)
                      ? (data?.shareUser ?? "作者缺省")
                      : (data?.author ?? "作者缺省"),
                  style: const TextStyle(color: Colors.black)),
              SizedBox(width: 5.r),
              Text(
                data?.niceDate ?? "",
                style: const TextStyle(fontSize: 10),
              ),
              const Expanded(child: SizedBox()),
              const Text(
                "TOP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              RouteUtils.push(
                  context,
                  WebViewPage(
                      loadResource: data?.link ?? "",
                      webViewType: WebViewType.URL),
                  {});
            },
            child: Container(
                padding: EdgeInsets.only(top: 10.r, bottom: 10.r),
                width: double.infinity,
                child: Text(
                  data?.title ?? "标题缺省",
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
                data?.superChapterName ?? "tag缺省",
                style: const TextStyle(fontSize: 10, color: Colors.blue),
              ),
              GestureDetector(
                onTap: () {
                  if (data?.collect ?? false) {
                    homeViewModel.unCollectArticle("${data?.id}", index);
                  } else {
                    homeViewModel.collectArticle("${data?.id}", index);
                  }
                },
                child: Image.asset(
                  data?.collect ?? false
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
