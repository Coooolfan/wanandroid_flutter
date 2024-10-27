class CommonWebsiteListData {
  List<CommonWebsiteData>? commonWebsiteList;

  CommonWebsiteListData.fromJson(dynamic json) {
    commonWebsiteList = [];
    if (json == null) {
      return;
    }
    if (json is List) {
      for (var item in json) {
        commonWebsiteList?.add(CommonWebsiteData.fromJson(item));
      }
    }
  }
}

class CommonWebsiteData {
  CommonWebsiteData({
    required this.category,
    required this.icon,
    required this.id,
    required this.link,
    required this.name,
    required this.order,
    required this.visible,
  });

  final String? category;
  final String? icon;
  final int? id;
  final String? link;
  final String? name;
  final int? order;
  final int? visible;

  factory CommonWebsiteData.fromJson(Map<String, dynamic> json) {
    return CommonWebsiteData(
      category: json["category"],
      icon: json["icon"],
      id: json["id"],
      link: json["link"],
      name: json["name"],
      order: json["order"],
      visible: json["visible"],
    );
  }

  Map<String, dynamic> toJson() => {
        "category": category,
        "icon": icon,
        "id": id,
        "link": link,
        "name": name,
        "order": order,
        "visible": visible,
      };
}
