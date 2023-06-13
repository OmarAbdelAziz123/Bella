class NotJoinedModel {
  List<CompaniesNotJoined>? companies;

  NotJoinedModel({this.companies});

  NotJoinedModel.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      companies = <CompaniesNotJoined>[];
      json['companies'].forEach((v) {
        companies!.add(new CompaniesNotJoined.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companies != null) {
      data['companies'] = this.companies!.map((v) => v.toJson()).toList();
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
  // String? termsAndConditions;

  CompaniesNotJoined(
      {this.id,
        this.displayName,
        this.logo,
        this.category,
        this.countryCode,
        // this.termsAndConditions
      });

  CompaniesNotJoined.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display_name'];
    logo = json['logo'];
    category = json['category'];
    countryCode = json['country_code'];
    // termsAndConditions = json['terms_and_conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['display_name'] = this.displayName;
    data['logo'] = this.logo;
    data['category'] = this.category;
    data['country_code'] = this.countryCode;
    // data['terms_and_conditions'] = this.termsAndConditions;
    return data;
  }
}
