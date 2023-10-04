class RegisterModel {
  String email;
  String phoneNumber;
  String address;
  String fullName;
  String workType;
  int companyType;
  int numberOfEmployees;
  String workInCompany;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['fullName'] = this.fullName;
    data['workType'] = this.workType;
    data['companyType'] = this.companyType;
    numberOfEmployees==null?print(''): data['numberOfEmployees'] = this.numberOfEmployees;
    workInCompany==null?print(''): data['workInCompany'] = this.workInCompany;
    return data;
  }
}