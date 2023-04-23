class JsonResponse {
  dynamic respCode;
  dynamic respDesc;

  JsonResponse({this.respCode, this.respDesc});

  JsonResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  Map<String, dynamic> map = <String, dynamic>{};

  fromJson(dynamic json) {
    respCode = json['resp_code'];
    respDesc = json['resp_desc'];
  }

  Map<String, dynamic> toJson(){
    map['resp_code'] = respCode;
    map['resp_desc'] = respDesc;
    return map;
  }
}

