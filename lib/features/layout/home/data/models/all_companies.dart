// ignore_for_file: non_constant_identifier_names

class AllCompaniesModel {
  List<AllCompanies>? allCompanies;

  AllCompaniesModel({this.allCompanies});

  AllCompaniesModel.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      allCompanies = <AllCompanies>[];
      json['companies'].forEach((v) {
        allCompanies!.add(new AllCompanies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allCompanies != null) {
      data['companies'] =
          this.allCompanies!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['display_name'] = this.displayName;
    data['logo'] = this.logo;
    data['category'] = this.category;
    data['country'] = this.country_code;
    data['terms_and_conditions'] = this.terms_and_conditions;
    return data;
  }
}
