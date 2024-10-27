import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid/pages/knowledge/detail/knowledge_detail_tab_child_page.dart';
import 'package:wanandroid/pages/knowledge/detail/knowledge_detail_tab_vm.dart';
import 'package:wanandroid/repository/datas/knowledge_data.dart';

class KnowledgeDetailTabPage extends StatefulWidget {
  const KnowledgeDetailTabPage({super.key, this.tabList});

  final List<KnowledgeData>? tabList;
  @override
  State createState() => _KnowledgeDetailTabPageState();
}

class _KnowledgeDetailTabPageState extends State<KnowledgeDetailTabPage>
    with SingleTickerProviderStateMixin {
  KnowledgeDetailTabVm vm = KnowledgeDetailTabVm();
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    vm.initTabs(widget.tabList);
    tabController =
        TabController(length: widget.tabList?.length ?? 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: vm.tabs,
            controller: tabController,
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
            isScrollable: true,
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: tabController,
            children: _buildTabView(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTabView() {
    return widget.tabList?.map((e) {
          return KnowledgeDetailTabChildPage(e.id.toString());
        }).toList() ??
        [];
  }
}
