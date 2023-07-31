class CheckModel {
  bool? hasJoined;

  CheckModel({this.hasJoined});

  CheckModel.fromJson(Map<String, dynamic> json) {
    hasJoined = json['has_joined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['has_joined'] = hasJoined;
    return data;
  }
}