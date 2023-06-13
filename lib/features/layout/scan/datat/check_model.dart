class CheckModel {
  bool? hasJoined;

  CheckModel({this.hasJoined});

  CheckModel.fromJson(Map<String, dynamic> json) {
    hasJoined = json['has_joined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_joined'] = this.hasJoined;
    return data;
  }
}