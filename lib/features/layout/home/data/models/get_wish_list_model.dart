class GetWishListModel {
  List<Wishlist>? wishlist;

  GetWishListModel({this.wishlist});

  GetWishListModel.fromJson(Map<String, dynamic> json) {
    if (json['wishlist'] != null) {
      wishlist = <Wishlist>[];
      json['wishlist'].forEach((v) {
        wishlist!.add(Wishlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wishlist != null) {
      data['wishlist'] = wishlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Wishlist {
  String? userId;
  String? companyId;
  String? companyLogoLink;
  String? companyDisplayName;
  String? productId;
  String? productImageLink;
  String? productTitle;
  dynamic regularPrice;
  dynamic salePrice;
  String? currency;
  String? id;

  Wishlist(
      {this.userId,
        this.companyId,
        this.companyLogoLink,
        this.companyDisplayName,
        this.productId,
        this.productImageLink,
        this.productTitle,
        this.regularPrice,
        this.salePrice,
        this.currency,
        this.id});

  Wishlist.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    companyId = json['company_id'];
    companyLogoLink = json['company_logo_link'];
    companyDisplayName = json['company_display_name'];
    productId = json['product_id'];
    productImageLink = json['product_image_link'];
    productTitle = json['product_title'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    currency = json['currency'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['company_id'] = companyId;
    data['company_logo_link'] = companyLogoLink;
    data['company_display_name'] = companyDisplayName;
    data['product_id'] = productId;
    data['product_image_link'] = productImageLink;
    data['product_title'] = productTitle;
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
    data['currency'] = currency;
    data['id'] = id;
    return data;
  }
}
