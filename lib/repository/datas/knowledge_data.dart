class KnowledgeListData {
  List<KnowledgeData>? knowledgeList;

  KnowledgeListData.fromJson(dynamic json) {
    knowledgeList = [];
    if (json == null) {
      return;
    }
    if (json is List) {
      for (var item in json) {
        knowledgeList?.add(KnowledgeData.fromJson(item));
      }
    }
  }
}

class KnowledgeData {
  KnowledgeData({
    required this.articleList,
    required this.author,
    required this.knowledgeChildren,
    required this.courseId,
    required this.cover,
    required this.desc,
    required this.id,
    required this.lisense,
    required this.lisenseLink,
    required this.name,
    required this.order,
    required this.parentChapterId,
    required this.type,
    required this.userControlSetTop,
    required this.visible,
  });

  final List<ArticleList> articleList;
  final String? author;
  final List<KnowledgeData> knowledgeChildren;
  final int? courseId;
  final String? cover;
  final String? desc;
  final int? id;
  final String? lisense;
  final String? lisenseLink;
  final String? name;
  final int? order;
  final int? parentChapterId;
  final int? type;
  final bool? userControlSetTop;
  final int? visible;

  String get knowledgeChildrenNameListString {
    if (knowledgeChildren.isEmpty) {
      return "";
    }
    return knowledgeChildren.map((e) => e.name ?? "").join(" ");
  }

  factory KnowledgeData.fromJson(Map<String, dynamic> json) {
    return KnowledgeData(
      articleList: json["articleList"] == null
          ? []
          : List<ArticleList>.from(
              json["articleList"]!.map((x) => ArticleList.fromJson(x))),
      author: json["author"],
      knowledgeChildren: json["children"] == null
          ? []
          : List<KnowledgeData>.from(
              json["children"]!.map((x) => KnowledgeData.fromJson(x))),
      courseId: json["courseId"],
      cover: json["cover"],
      desc: json["desc"],
      id: json["id"],
      lisense: json["lisense"],
      lisenseLink: json["lisenseLink"],
      name: json["name"],
      order: json["order"],
      parentChapterId: json["parentChapterId"],
      type: json["type"],
      userControlSetTop: json["userControlSetTop"],
      visible: json["visible"],
    );
  }

  Map<String, dynamic> toJson() => {
        "articleList": articleList.map((x) => x.toJson()).toList(),
        "author": author,
        "children": knowledgeChildren.map((x) => x.toJson()).toList(),
        "courseId": courseId,
        "cover": cover,
        "desc": desc,
        "id": id,
        "lisense": lisense,
        "lisenseLink": lisenseLink,
        "name": name,
        "order": order,
        "parentChapterId": parentChapterId,
        "type": type,
        "userControlSetTop": userControlSetTop,
        "visible": visible,
      };
}

class ArticleList {
  ArticleList({
    required this.adminAdd,
    required this.apkLink,
    required this.audit,
    required this.author,
    required this.canEdit,
    required this.chapterId,
    required this.chapterName,
    required this.collect,
    required this.courseId,
    required this.desc,
    required this.descMd,
    required this.envelopePic,
    required this.fresh,
    required this.host,
    required this.id,
    required this.isAdminAdd,
    required this.link,
    required this.niceDate,
    required this.niceShareDate,
    required this.origin,
    required this.prefix,
    required this.projectLink,
    required this.publishTime,
    required this.realSuperChapterId,
    required this.selfVisible,
    required this.shareDate,
    required this.shareUser,
    required this.superChapterId,
    required this.superChapterName,
    required this.tags,
    required this.title,
    required this.type,
    required this.userId,
    required this.visible,
    required this.zan,
  });

  final bool? adminAdd;
  final String? apkLink;
  final int? audit;
  final String? author;
  final bool? canEdit;
  final int? chapterId;
  final String? chapterName;
  final bool? collect;
  final int? courseId;
  final String? desc;
  final String? descMd;
  final String? envelopePic;
  final bool? fresh;
  final String? host;
  final int? id;
  final bool? isAdminAdd;
  final String? link;
  final String? niceDate;
  final String? niceShareDate;
  final String? origin;
  final String? prefix;
  final String? projectLink;
  final int? publishTime;
  final int? realSuperChapterId;
  final int? selfVisible;
  final int? shareDate;
  final String? shareUser;
  final int? superChapterId;
  final String? superChapterName;
  final List<dynamic> tags;
  final String? title;
  final int? type;
  final int? userId;
  final int? visible;
  final int? zan;

  factory ArticleList.fromJson(Map<String, dynamic> json) {
    return ArticleList(
      adminAdd: json["adminAdd"],
      apkLink: json["apkLink"],
      audit: json["audit"],
      author: json["author"],
      canEdit: json["canEdit"],
      chapterId: json["chapterId"],
      chapterName: json["chapterName"],
      collect: json["collect"],
      courseId: json["courseId"],
      desc: json["desc"],
      descMd: json["descMd"],
      envelopePic: json["envelopePic"],
      fresh: json["fresh"],
      host: json["host"],
      id: json["id"],
      isAdminAdd: json["isAdminAdd"],
      link: json["link"],
      niceDate: json["niceDate"],
      niceShareDate: json["niceShareDate"],
      origin: json["origin"],
      prefix: json["prefix"],
      projectLink: json["projectLink"],
      publishTime: json["publishTime"],
      realSuperChapterId: json["realSuperChapterId"],
      selfVisible: json["selfVisible"],
      shareDate: json["shareDate"],
      shareUser: json["shareUser"],
      superChapterId: json["superChapterId"],
      superChapterName: json["superChapterName"],
      tags: json["tags"] == null
          ? []
          : List<dynamic>.from(json["tags"]!.map((x) => x)),
      title: json["title"],
      type: json["type"],
      userId: json["userId"],
      visible: json["visible"],
      zan: json["zan"],
    );
  }

  Map<String, dynamic> toJson() => {
        "adminAdd": adminAdd,
        "apkLink": apkLink,
        "audit": audit,
        "author": author,
        "canEdit": canEdit,
        "chapterId": chapterId,
        "chapterName": chapterName,
        "collect": collect,
        "courseId": courseId,
        "desc": desc,
        "descMd": descMd,
        "envelopePic": envelopePic,
        "fresh": fresh,
        "host": host,
        "id": id,
        "isAdminAdd": isAdminAdd,
        "link": link,
        "niceDate": niceDate,
        "niceShareDate": niceShareDate,
        "origin": origin,
        "prefix": prefix,
        "projectLink": projectLink,
        "publishTime": publishTime,
        "realSuperChapterId": realSuperChapterId,
        "selfVisible": selfVisible,
        "shareDate": shareDate,
        "shareUser": shareUser,
        "superChapterId": superChapterId,
        "superChapterName": superChapterName,
        "tags": tags.map((x) => x).toList(),
        "title": title,
        "type": type,
        "userId": userId,
        "visible": visible,
        "zan": zan,
      };
}
