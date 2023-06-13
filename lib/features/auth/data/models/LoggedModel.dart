class LoggedModel {
  String? status;
  User? user;

  LoggedModel({this.status, this.user});

  LoggedModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? personalNumber;
  String? name;
  String? givenName;
  String? surname;

  User({this.personalNumber, this.name, this.givenName, this.surname});

  User.fromJson(Map<String, dynamic> json) {
    personalNumber = json['personalNumber'];
    name = json['name'];
    givenName = json['givenName'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['personalNumber'] = personalNumber;
    data['name'] = name;
    data['givenName'] = givenName;
    data['surname'] = surname;
    return data;
  }
}
