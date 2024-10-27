class LoginData {
  LoginData({
    required this.admin,
    required this.chapterTops,
    required this.coinCount,
    required this.collectIds,
    required this.email,
    required this.icon,
    required this.id,
    required this.nickname,
    required this.password,
    required this.publicName,
    required this.token,
    required this.type,
    required this.username,
  });

  final bool? admin;
  final List<dynamic> chapterTops;
  final int? coinCount;
  final List<dynamic> collectIds;
  final String? email;
  final String? icon;
  final int? id;
  final String? nickname;
  final String? password;
  final String? publicName;
  final String? token;
  final int? type;
  final String? username;

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      admin: json["admin"],
      chapterTops: json["chapterTops"] == null
          ? []
          : List<dynamic>.from(json["chapterTops"]!.map((x) => x)),
      coinCount: json["coinCount"],
      collectIds: json["collectIds"] == null
          ? []
          : List<dynamic>.from(json["collectIds"]!.map((x) => x)),
      email: json["email"],
      icon: json["icon"],
      id: json["id"],
      nickname: json["nickname"],
      password: json["password"],
      publicName: json["publicName"],
      token: json["token"],
      type: json["type"],
      username: json["username"],
    );
  }

  Map<String, dynamic> toJson() => {
        "admin": admin,
        "chapterTops": chapterTops.map((x) => x).toList(),
        "coinCount": coinCount,
        "collectIds": collectIds.map((x) => x).toList(),
        "email": email,
        "icon": icon,
        "id": id,
        "nickname": nickname,
        "password": password,
        "publicName": publicName,
        "token": token,
        "type": type,
        "username": username,
      };
}
