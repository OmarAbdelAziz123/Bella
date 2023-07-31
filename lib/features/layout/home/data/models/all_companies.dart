// ignore_for_file: non_constant_identifier_names

class AllCompaniesModel {
  List<AllCompanies>? allCompanies;

  AllCompaniesModel({this.allCompanies});

  AllCompaniesModel.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      allCompanies = <AllCompanies>[];
      json['companies'].forEach((v) {
        allCompanies!.add(AllCompanies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allCompanies != null) {
      data['companies'] =
          allCompanies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllCompanies {
  String? id;
  String? displayName;
  String? logo;
  String? category;
  String? country_code;
  String? terms_and_conditions;

  AllCompanies({
    this.id,
    this.displayName,
    this.logo,
    this.category,
    this.country_code,
    this.terms_and_conditions
  });

  AllCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display_name'];
    logo = json['logo'];
    category = json['category'];
    country_code = json['country_code'];
    terms_and_conditions = json['terms_and_conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display_name'] = displayName;
    data['logo'] = logo;
    data['category'] = category;
    data['country'] = country_code;
    data['terms_and_conditions'] = terms_and_conditions;
    return data;
  }
}
