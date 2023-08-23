class GetRecommendedProductsModel {
  List<RecommendedProducts>? recommendedProducts;

  GetRecommendedProductsModel({this.recommendedProducts});

  GetRecommendedProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['recommended_products'] != null) {
      recommendedProducts = <RecommendedProducts>[];
      json['recommended_products'].forEach((v) {
        recommendedProducts!.add(RecommendedProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recommendedProducts != null) {
      data['recommended_products'] =
          recommendedProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecommendedProducts {
  String? name;
  String? imageLink;
  String? campaignText;
  String? description;
  NewPrice? newPrice;
  OldPrice? oldPrice;
  bool? membersOnly;
  String? category;
  dynamic productCount;
  String? offerType;
  String? campaignType;
  double? savingInSEK;
  String? priceDecreasePercentage;
  String? type;
  String? companyId;
  String? companyDisplayName;
  String? companyLogo;
  String? id;
  String? sRid;
  String? sSelf;
  String? sEtag;
  String? sAttachments;
  dynamic iTs;

  RecommendedProducts(
      {this.name,
      this.imageLink,
      this.campaignText,
      this.description,
      this.newPrice,
      this.oldPrice,
      this.membersOnly,
      this.category,
      this.productCount,
      this.offerType,
      this.campaignType,
      this.savingInSEK,
      this.priceDecreasePercentage,
      this.type,
      this.companyId,
      this.companyDisplayName,
      this.companyLogo,
      this.id,
      this.sRid,
      this.sSelf,
      this.sEtag,
      this.sAttachments,
      this.iTs});

  RecommendedProducts.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '...';
    imageLink = json['image_link'];
    campaignText = json['campaign_text'] ?? '...';
    description = json['description'] ?? '...';
    newPrice =
        json['new_price'] != null ? NewPrice.fromJson(json['new_price']) : null;
    oldPrice =
        json['old_price'] != null ? OldPrice.fromJson(json['old_price']) : null;
    membersOnly = json['members_only'];
    category = json['category'] ?? '';
    productCount = json['product_count'] ?? '';
    offerType = json['offer_type'] ?? '';
    campaignType = json['campaign_type'] ?? '...';
    savingInSEK = json['saving_in_SEK'] ?? 0.0;
    priceDecreasePercentage = json['price_decrease_percentage'] ?? '';
    type = json['type'] ?? '';
    companyId = json['company_id'] ?? '';
    companyDisplayName = json['company_display_name'] ?? '';
    companyLogo = json['company_logo'] ?? '';
    id = json['id'] ?? '';
    sRid = json['_rid'] ?? '';
    sSelf = json['_self'] ?? '';
    sEtag = json['_etag'] ?? '';
    sAttachments = json['_attachments'] ?? '';
    iTs = json['_ts'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image_link'] = imageLink;
    data['campaign_text'] = campaignText;
    data['description'] = description;
    if (newPrice != null) {
      data['new_price'] = newPrice!.toJson();
    }
    if (oldPrice != null) {
      data['old_price'] = oldPrice!.toJson();
    }
    data['members_only'] = membersOnly;
    data['category'] = category;
    data['product_count'] = productCount;
    data['offer_type'] = offerType;
    data['campaign_type'] = campaignType;
    data['saving_in_SEK'] = savingInSEK;
    data['price_decrease_percentage'] = priceDecreasePercentage;
    data['type'] = type;
    data['company_id'] = companyId;
    data['company_display_name'] = companyDisplayName;
    data['company_logo'] = companyLogo;
    data['id'] = id;
    data['_rid'] = sRid;
    data['_self'] = sSelf;
    data['_etag'] = sEtag;
    data['_attachments'] = sAttachments;
    data['_ts'] = iTs;
    return data;
  }
}

class NewPrice {
  double? price;
  dynamic unit;

  NewPrice({this.price, this.unit});

  NewPrice.fromJson(Map<String, dynamic> json) {
    price = json['price'] ?? 0;
    unit = json['unit'] ?? 'kr';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['unit'] = unit;
    return data;
  }
}

class OldPrice {
  dynamic price;
  dynamic unit;

  OldPrice({this.price, this.unit});

  OldPrice.fromJson(Map<String, dynamic> json) {
    price = json['price'] ?? 0;
    unit = json['unit'] ?? 'kr';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['unit'] = unit;
    return data;
  }
}
