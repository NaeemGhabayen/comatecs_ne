class OTPLoginModel {
  String email;
  String phone;
  String code;
  String deviceToken;
  OTPLoginModel({this.email, this.phone , this.code , this.deviceToken});

  OTPLoginModel.fromJson(Map<String, dynamic> json) {
    json['email']==null?print("s"):email = json['email'];
    json['phone']==null?print("phone is null"):  phone = json['phone'];
    code = json['code'];
    deviceToken = json['deviceToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  email==null?print(""):  data['email'] = this.email;
    phone==null?print(""): data['phone'] = this.phone;
    data['code'] = this.code;
    data['deviceToken'] = this.deviceToken;
    return data;
  }
}
