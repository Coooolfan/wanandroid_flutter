import 'package:flutter/material.dart';
import 'package:wanandroid/common_ui/web/webview_page.dart';
import 'package:wanandroid/common_ui/web/webview_widget.dart';
import 'package:wanandroid/pages/auth/login_page.dart';
import 'package:wanandroid/pages/auth/register_page.dart';
import 'package:wanandroid/pages/knowledge/detail/knowledge_detail_tab_page.dart';
import 'package:wanandroid/pages/search/search_page.dart';
import 'package:wanandroid/pages/tab_page.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.tab:
        return pageRoute(TabPage(), settings: settings);
      case RoutePath.webViewPage:
        return pageRoute(
            WebViewPage(loadResource: "", webViewType: WebViewType.URL),
            settings: settings);
      case RoutePath.loginPage:
        return pageRoute(const LoginPage(), settings: settings);
      case RoutePath.registerPage:
        return pageRoute(const RegisterPage(), settings: settings);
      case RoutePath.knowledgeDetailTabPage:
        return pageRoute(const KnowledgeDetailTabPage(), settings: settings);
      case RoutePath.searchPage:
        return pageRoute(SearchPage(), settings: settings);
      default:
        return pageRoute(Scaffold(
            body: SafeArea(
                child: Center(child: Text("路由 ${settings.name} 不存在")))));
    }
  }

  static MaterialPageRoute pageRoute(Widget page,
      {RouteSettings? settings,
      bool? maintainState,
      bool? fullscreenDialog,
      bool? allowSnapshotting}) {
    return MaterialPageRoute(
      builder: (context) => page,
      settings: settings,
      maintainState: maintainState ?? true,
      fullscreenDialog: fullscreenDialog ?? false,
      allowSnapshotting: allowSnapshotting ?? true,
    );
  }
}

class RoutePath {
  static const String tab = '/';
  static const String webViewPage = '/web_view_page';
  static const String loginPage = '/login_page';
  static const String registerPage = '/register_page';
  static const String knowledgeDetailTabPage = '/knowledge_detail_tab_page';
  static const String searchPage = '/search_page';
}
