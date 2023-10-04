class AdvertisementModel {
  int id;
  String title;
  String body;
  String imageUrl;
  String startDate;
  String endDate;

  AdvertisementModel(
      {this.id,
        this.title,
        this.body,
        this.imageUrl,
        this.startDate,
        this.endDate});

  AdvertisementModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    imageUrl = json['imageUrl'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['imageUrl'] = this.imageUrl;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    return data;
  }
}