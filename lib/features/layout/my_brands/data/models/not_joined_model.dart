class NotJoinedModel {
  List<CompaniesNotJoined>? companies;

  NotJoinedModel({this.companies});

  NotJoinedModel.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      companies = <CompaniesNotJoined>[];
      json['companies'].forEach((v) {
        companies!.add(CompaniesNotJoined.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (companies != null) {
      data['companies'] = companies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompaniesNotJoined {
  String? id;
  String? displayName;
  String? logo;
  String? category;
  String? countryCode;

  CompaniesNotJoined(
      {this.id,
        this.displayName,
        this.logo,
        this.category,
        this.countryCode,
      });

  CompaniesNotJoined.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display_name'];
    logo = json['logo'];
    category = json['category'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display_name'] = displayName;
    data['logo'] = logo;
    data['category'] = category;
    data['country_code'] = countryCode;
    return data;
  }
}
