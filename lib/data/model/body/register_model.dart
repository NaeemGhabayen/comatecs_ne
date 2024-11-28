class RegisterModel {
  String? email;
  String? phoneNumber;
  String? address;
  String? fullName;
  String? workType;
  int? companyType;
  int? numberOfEmployees;
  String? workInCompany;

  RegisterModel(
      {this.email,
        this.phoneNumber,
        this.address,
        this.fullName,
        this.workType,
        this.companyType,
        this.numberOfEmployees,
        this.workInCompany});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    fullName = json['fullName'];
    workType = json['workType'];
    companyType = json['companyType'];
    numberOfEmployees = json['numberOfEmployees'];
    workInCompany = json['workInCompany'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['address'] = address;
    data['fullName'] = fullName;
    data['workType'] = workType;
    data['companyType'] = companyType;
    numberOfEmployees==null?print(''): data['numberOfEmployees'] = numberOfEmployees;
    workInCompany==null?print(''): data['workInCompany'] = workInCompany;
    return data;
  }
}