class LoginModel {
  String email;
  String phone;
  bool isSocial;

  LoginModel({this.email, this.phone, this.isSocial});

  LoginModel.fromJson(Map<String, dynamic> json) {
    json['email']==null?print("s"):email = json['email'];
    json['phone']==null?print("phone is null"):  phone = json['phone'];
    isSocial = json['isSocial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  email==null?print(""):  data['email'] = this.email;
    phone==null?print(""): data['phone'] = this.phone;
 data['isSocial'] = this.isSocial;
    return data;
  }
}
