class SeeAllModel {
  List<Companies>? companies;

  SeeAllModel({this.companies});

  SeeAllModel.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies!.add(Companies.fromJson(v));
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

class Companies {
  String? id;
  String? displayName;
  String? logo;
  String? category;
  String? countryCode;
  String? termsAndConditions;

  Companies(
      {this.id,
        this.displayName,
        this.logo,
        this.category,
        this.countryCode,
        this.termsAndConditions});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display_name'];
    logo = json['logo'];
    category = json['category'];
    countryCode = json['country_code'];
    termsAndConditions = json['terms_and_conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display_name'] = displayName;
    data['logo'] = logo;
    data['category'] = category;
    data['country_code'] = countryCode;
    data['terms_and_conditions'] = termsAndConditions;
    return data;
  }
}
