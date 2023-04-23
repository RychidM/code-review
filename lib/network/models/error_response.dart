class ErrorResponse {
  ErrorResponse({this.respCode, this.respDesc});

  String? respCode;
  String? respDesc;

  ErrorResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  fromJson(json) {
    respCode = json['resp_code'];
    respDesc = json['resp_desc'];
  }

  Map<String, dynamic> map = <String, dynamic> {};

  Map<String, dynamic> toJson() {
    map['resp_code'] = respCode;
    map['resp_desc'] = respDesc;
    return map;
  }
}
