class RegisterModel {
  String fullname;
  String fullnameAr;
  String email;
  String phone;
  String dob;
  String gender;
  String role;
  String timezone;
  var country;
  var city;
  var nationality;
  String workfield;
  String experience;
  String nos;
  var language;
  String achievement;
  String idNumber;
  String age;
  String qualification;
  String about;
  String about_ar;
  String experienceInclude;
  String price;
  Map<String, List<int>> fields;

  RegisterModel({this.fullname, this.fullnameAr, this.email, this.phone, this.dob, this.gender, this.role, this.timezone,
      this.country, this.city,this.about_ar, this.price,this.nationality,this.experienceInclude, this.about, this.workfield, this.experience, this.nos, this.qualification, this.achievement, this.idNumber, this.language, this.age, this.fields});


  RegisterModel.fromJson(Map<String, dynamic> json) {
    fullname = json['full_name'];
    fullnameAr = json['full_name_ar'];
    email = json['email'];
    phone = json['phone'];
    dob = json['dob'];
    gender = json['gender'];
    about_ar = json['about_ar'];
    role = json['role'];
    timezone = json['timezone'];
    country = json['country'];
    city = json['city'];
    nationality = json['nationality'];
    idNumber = json['identity'];
    qualification = json['qualification'];
    about = json['about'];
    experienceInclude = json['experienceInclude'];
    price = json['price'];
    fields = json['fields'];
    json['achievement']==null?print("s"):achievement = json['achievement'];
    json['nos']==null?print("s"):nos = json['nos'];
    json['workfield']==null?print("s"):workfield = json['workfield'];
    json['experience']==null?print("s"):experience = json['experience'];
    json['languages']==null?print("s"):language = json['languages'];
    json['age']==null?print("s"):age = json['age'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullname;
    data['full_name_ar'] = this.fullnameAr;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['nationality'] = this.nationality;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['role'] = this.role;
    data['timezone'] = this.timezone;
    data['country'] = this.country;
    data['city'] = this.city;
    data['identity'] = this.idNumber;
    data['about'] = this.about;
    data['about_ar'] = this.about_ar;
    data['price'] = this.price;
    data['experienceInclude'] = this.experienceInclude;
    data['qualification'] = this.qualification;
    data['fields'] = this.fields;
    achievement==null?print(""): data['achievement'] = this.achievement;
    nos==null?print(""): data['nos'] = this.nos;
    experience==null?print(""): data['experience'] = this.experience;
    workfield==null?print(""): data['workfield'] = this.workfield;
    language==null?print(""): data['languages'] = this.language;
    age==null?print(""): data['age'] = this.age;

    return data;
  }
}
