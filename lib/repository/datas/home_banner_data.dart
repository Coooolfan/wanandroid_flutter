class HomeBannerListData {
  List<HomeBannerData?>? bannerList;

  HomeBannerListData.fromJson(dynamic json) {
    bannerList = [];
    if (json == null) {
      return;
    }
    if (json is List) {
      for (var e in json) {
        bannerList?.add(HomeBannerData.fromJson(e));
      }
    }
  }
}

class HomeBannerData {
  HomeBannerData({
    required this.desc,
    required this.id,
    required this.imagePath,
    required this.isVisible,
    required this.order,
    required this.title,
    required this.type,
    required this.url,
  });

  final String? desc;
  final int? id;
  final String? imagePath;
  final int? isVisible;
  final int? order;
  final String? title;
  final int? type;
  final String? url;

  factory HomeBannerData.fromJson(Map<String, dynamic> json) {
    return HomeBannerData(
      desc: json["desc"],
      id: json["id"],
      imagePath: json["imagePath"],
      isVisible: json["isVisible"],
      order: json["order"],
      title: json["title"],
      type: json["type"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "id": id,
        "imagePath": imagePath,
        "isVisible": isVisible,
        "order": order,
        "title": title,
        "type": type,
        "url": url,
      };
}
