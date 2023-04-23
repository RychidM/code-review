class SignInErrorModel {
  String? respCode;
  String? respDesc;

  SignInErrorModel({this.respCode, this.respDesc});

  SignInErrorModel.fromJson(dynamic json) {
    respCode = json['respCode'];
    respDesc = json['respDesc'];
  }

  Map<String, dynamic> map = <String, dynamic>{};

  Map<String, dynamic> toJson() {
    map['respCode'] = respCode;
    map['respDesc'] = respDesc;
    return map;
  }

  SignInErrorModel copyWith({
        String? respCode,
        String? respDesc,
    }) => 
        SignInErrorModel(
            respCode: respCode ?? this.respCode,
            respDesc: respDesc ?? this.respDesc,
        );

}
