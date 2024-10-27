import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid/pages/search/search_vm.dart';
import 'package:wanandroid/route/RouteUtils.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, this.keyword});

  final String? keyword;
  @override
  State createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _controller;
  bool isFieldEmpty = true;
  SearchVm vm = SearchVm();
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.keyword ?? "");
    vm.search(widget.keyword ?? "");
    isFieldEmpty = widget.keyword?.isEmpty ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => vm,
          child: Consumer<SearchVm>(
            builder: (context, vm, child) {
              return Column(
                children: [
                  _searchBar(),
                  Expanded(
                      child: ListView.builder(
                          itemCount: vm.searchList?.length ?? 0,
                          itemBuilder: (context, index) {
                            return _searchListItem(
                                vm.searchList?[index].title ?? "");
                          })),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
      color: Colors.grey,
      child: Row(
        children: [
          GestureDetector(
              onTap: () => _onBack(),
              child: Image.asset('assets/images/icon_back.png',
                  width: 30.w, height: 30.h)),
          SizedBox(width: 10.w),
          Expanded(
              child: TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            onChanged: (value) => _onFieldChange(value),
            onSubmitted: (value) => _onFieldSearch(value),
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              suffixIcon: isFieldEmpty
                  ? null
                  : GestureDetector(
                      onTap: () => _onFieldClear(),
                      child: const Icon(Icons.clear),
                    ),
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 4.h, bottom: 4.h),
              focusedBorder: _defaultSearchBorder(),
              enabledBorder: _defaultSearchBorder(),
            ),
            controller: _controller,
          )),
          SizedBox(width: 10.w),
          GestureDetector(
              onTap: () => _onButtonSearch(),
              child: const Text("搜索", style: TextStyle(fontSize: 15))),
        ],
      ),
    );
  }

  _onBack() {
    RouteUtils.pop(context);
  }

  _onFieldSearch(String value) {
    vm.search(value);
  }

  _onButtonSearch() {
    vm.search(_controller.text);
    FocusScope.of(context).requestFocus(FocusNode());
  }

  _searchListItem(String? title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding:
            EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 0.5.w, color: Colors.grey))),
        child: Html(
          data: title ?? "",
          style: {"em": Style(fontWeight: FontWeight.bold)},
        ),
      ),
    );
  }

  _defaultSearchBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      borderSide: const BorderSide(color: Colors.white),
    );
  }

  _onFieldChange(String value) {
    setState(() {
      isFieldEmpty = value.isEmpty;
    });
  }

  _onFieldClear() {
    _controller.clear();
    setState(() {
      isFieldEmpty = true;
    });
  }
}
