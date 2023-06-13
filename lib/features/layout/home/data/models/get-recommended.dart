class GetRecommendedModel {
  List<RecommendedCompanies>? recommendedCompanies;

  GetRecommendedModel({this.recommendedCompanies});

  GetRecommendedModel.fromJson(Map<String, dynamic> json) {
    if (json['recommended_companies'] != null) {
      recommendedCompanies = <RecommendedCompanies>[];
      json['recommended_companies'].forEach((v) {
        recommendedCompanies!.add(new RecommendedCompanies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recommendedCompanies != null) {
      data['recommended_companies'] =
          this.recommendedCompanies!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['display_name'] = this.displayName;
    data['logo'] = this.logo;
    data['category'] = this.category;
    data['country_code'] = this.countryCode;
    data['terms_and_conditions'] = this.termsAndConditions;
    return data;
  }
}
