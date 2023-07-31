// ignore_for_file: non_constant_identifier_names

class GetCompanyProductsModel {
  List<CompanyProducts>? companyProducts;

  GetCompanyProductsModel({this.companyProducts});

  GetCompanyProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['company_products'] != null) {
      companyProducts = <CompanyProducts>[];
      json['company_products'].forEach((v) {
        companyProducts!.add(CompanyProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (companyProducts != null) {
      data['company_products'] =
          companyProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyProducts {
  String? companyId;
  List<String>? storeId;
  List<String>? imageLinks;
  String? title;
  String? description;
  List<String>? categories;
  Pricing? pricing;
  bool? membersOnly;
  bool? availability;
  String? validFrom;
  String? validTo;
  List<String>? channels;
  String? type;
  String? company_display_name;
  String? company_logo;
  String? id;
  String? sRid;
  String? sSelf;
  String? sEtag;
  String? sAttachments;
  int? iTs;

  CompanyProducts(
      {this.companyId,
        this.storeId,
        this.imageLinks,
        this.title,
        this.description,
        this.categories,
        this.pricing,
        this.membersOnly,
        this.availability,
        this.validFrom,
        this.validTo,
        this.channels,
        this.type,
        this.company_display_name,
        this.company_logo,
        this.id,
        this.sRid,
        this.sSelf,
        this.sEtag,
        this.sAttachments,
        this.iTs});

  CompanyProducts.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    storeId = json['store_id'].cast<String>();
    imageLinks = json['image_links'].cast<String>();
    title = json['title'];
    description = json['description'];
    categories = json['categories'].cast<String>();
    pricing =
    json['pricing'] != null ? Pricing.fromJson(json['pricing']) : null;
    membersOnly = json['members_only'];
    availability = json['availability'];
    validFrom = json['valid_from'];
    validTo = json['valid_to'];
    channels = json['channels'].cast<String>();
    type = json['type'];
    company_display_name = json['company_display_name'];
    company_logo = json['company_logo'];
    id = json['id'];
    sRid = json['_rid'];
    sSelf = json['_self'];
    sEtag = json['_etag'];
    sAttachments = json['_attachments'];
    iTs = json['_ts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_id'] = companyId;
    data['store_id'] = storeId;
    data['image_links'] = imageLinks;
    data['title'] = title;
    data['description'] = description;
    data['categories'] = categories;
    if (pricing != null) {
      data['pricing'] = pricing!.toJson();
    }
    data['members_only'] = membersOnly;
    data['availability'] = availability;
    data['valid_from'] = validFrom;
    data['valid_to'] = validTo;
    data['channels'] = channels;
    data['type'] = type;
    data['company_display_name'] = company_display_name;
    data['company_logo'] = company_logo;
    data['id'] = id;
    data['_rid'] = sRid;
    data['_self'] = sSelf;
    data['_etag'] = sEtag;
    data['_attachments'] = sAttachments;
    data['_ts'] = iTs;
    return data;
  }
}

class Pricing {
  double? regularPrice;
  double? salePrice;
  String? currency;

  Pricing({this.regularPrice, this.salePrice, this.currency});

  Pricing.fromJson(Map<String, dynamic> json) {
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
    data['currency'] = currency;
    return data;
  }
}
