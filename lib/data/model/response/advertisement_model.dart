class AdvertisementModel {
  int? id;
  String? title;
  String? body;
  String? imageUrl;
  String? startDate;
  String? endDate;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['imageUrl'] = imageUrl;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    return data;
  }
}