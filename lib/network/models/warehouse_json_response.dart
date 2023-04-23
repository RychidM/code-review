class WarehouseResponse {
  WarehouseResponse({this.respCode, this.respMsg});

  String? respCode;
  String? respMsg;

  WarehouseResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  fromJson(json) {
    respCode = json['resp_code'];
    respMsg = json['resp_msg'];
  }

  Map<String, dynamic> map = <String, dynamic> {};

  Map<String, dynamic> toJson() {
    map['resp_code'] = respCode;
    map['resp_msg'] = respMsg;
    return map;
  }
}