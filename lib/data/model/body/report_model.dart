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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beneficiaryid'] = this.beneficiaryid;
    data['full_name'] = this.full_name;
    data['full_name_ar'] = this.full_name_ar;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['country'] = this.country;
    data['city'] = this.city;
    data['basicfieldid'] = this.basicfieldid;
    data['beneficiarystatus'] = this.beneficiarystatus;
    data['beneficiarynotes'] = this.beneficiarynotes;
    data['sessionid'] = this.sessionid;
    data['type'] = this.type;
    data['sessiontopic'] = this.sessiontopic;
    data['adviserid'] = this.adviserid;
    data['socualstatus'] = this.socualstatus;


    return data;
  }
}
