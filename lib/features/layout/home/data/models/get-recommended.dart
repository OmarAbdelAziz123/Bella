// ignore_for_file: file_names
class GetRecommendedModel {
  List<RecommendedCompanies>? recommendedCompanies;

  GetRecommendedModel({this.recommendedCompanies});

  GetRecommendedModel.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      recommendedCompanies = <RecommendedCompanies>[];
      json['companies'].forEach((v) {
        recommendedCompanies!.add(RecommendedCompanies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recommendedCompanies != null) {
      data['companies'] =
          recommendedCompanies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecommendedCompanies {
  String? id;
  String? displayName;
  String? logo;
  String? category;
  String? countryCode;
  String? termsAndConditions;

  RecommendedCompanies(
      {this.id,
        this.displayName,
        this.logo,
        this.category,
        this.countryCode,
        this.termsAndConditions});

  RecommendedCompanies.fromJson(Map<String, dynamic> json) {
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
