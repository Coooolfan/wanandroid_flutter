class SearchHotKeyListData {
  List<SearchHotKeyData>? searchHotKeyList;

  SearchHotKeyListData.fromJson(dynamic json) {
    searchHotKeyList = [];
    if (json == null) {
      return;
    }
    if (json is List) {
      for (var item in json) {
        searchHotKeyList?.add(SearchHotKeyData.fromJson(item));
      }
    }
  }
}

class SearchHotKeyData {
  SearchHotKeyData({
    required this.id,
    required this.link,
    required this.name,
    required this.order,
    required this.visible,
  });

  final int? id;
  final String? link;
  final String? name;
  final int? order;
  final int? visible;

  factory SearchHotKeyData.fromJson(Map<String, dynamic> json) {
    return SearchHotKeyData(
      id: json["id"],
      link: json["link"],
      name: json["name"],
      order: json["order"],
      visible: json["visible"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "name": name,
        "order": order,
        "visible": visible,
      };
}
