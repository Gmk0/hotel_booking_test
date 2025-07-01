class BaseResponseEntity {
  int? code;
  String? msg;
  Map? data;

  BaseResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory BaseResponseEntity.fromJson(Map<String, dynamic> json) =>
      BaseResponseEntity(
        code: json["code"],
        msg: json["message"],
        data: json["data"] != null ? json["data"] : null,
      );

  Map<String, dynamic> toJson() => {
        "counts": code,
        "msg": msg,
        "items": data,
      };
}

class BindFcmTokenRequestEntity {
  String? fcmtoken;

  BindFcmTokenRequestEntity({
    this.fcmtoken,
  });

  Map<String, dynamic> toJson() => {
        "fcmtoken": fcmtoken,
      };
}
