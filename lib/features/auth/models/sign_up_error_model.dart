class SignupErrorModel {
  SignupErrorModel({
    String? respCode,
    String? respDesc,
  }) {
    _respCode = respCode;
    _respDesc = respDesc;
  }

  SignupErrorModel.fromJson(dynamic json) {
    _respCode = json['resp_code'];
    _respDesc = json['resp_desc'];
  }

  String? _respCode;
  String? _respDesc;

  SignupErrorModel copyWith({
    String? respCode,
    String? respDesc,
  }) =>
      SignupErrorModel(
        respCode: respCode ?? _respCode,
        respDesc: respDesc ?? _respDesc,
      );

  String? get respCode => _respCode;

  String? get respDesc => _respDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resp_code'] = _respCode;
      map['resp_desc'] = _respDesc;
    return map;
  }
}
