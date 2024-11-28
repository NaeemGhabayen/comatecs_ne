class ReportModel {
  var beneficiaryid;
  var full_name;
  var full_name_ar;
  var gender;
  var dob;
  var country;
  var city;
  var basicfieldid;
  var beneficiarystatus;
  var beneficiarynotes;
  var sessionid;
  var type;
  var sessiontopic;
  var adviserid;
  var socualstatus;


  ReportModel({this.beneficiaryid, this.full_name, this.full_name_ar, this.gender, this.dob, this.country, this.city,
      this.basicfieldid,this.socualstatus, this.adviserid,  this.sessiontopic,   this.type, this.beneficiarystatus, this.beneficiarynotes, this.sessionid});

  ReportModel.fromJson(Map<String, dynamic> json) {
    beneficiaryid = json['beneficiaryid'];
    full_name = json['full_name'];
    full_name_ar = json['full_name_ar'];
    gender = json['gender'];
    dob = json['dob'];
    country = json['country'];
    city = json['city'];
    sessiontopic = json['sessiontopic'];
    basicfieldid = json['basicfieldid'];
    beneficiarystatus = json['beneficiarystatus'];
    beneficiarynotes = json['beneficiarynotes'];
    sessionid = json['sessionid'];
    type = json['type'];
    adviserid = json['adviserid'];
    socualstatus = json['socualstatus'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['beneficiaryid'] = beneficiaryid;
    data['full_name'] = full_name;
    data['full_name_ar'] = full_name_ar;
    data['gender'] = gender;
    data['dob'] = dob;
    data['country'] = country;
    data['city'] = city;
    data['basicfieldid'] = basicfieldid;
    data['beneficiarystatus'] = beneficiarystatus;
    data['beneficiarynotes'] = beneficiarynotes;
    data['sessionid'] = sessionid;
    data['type'] = type;
    data['sessiontopic'] = sessiontopic;
    data['adviserid'] = adviserid;
    data['socualstatus'] = socualstatus;


    return data;
  }
}
