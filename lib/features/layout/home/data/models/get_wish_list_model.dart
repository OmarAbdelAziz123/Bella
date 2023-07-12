class GetWishListModel {
  List<Wishlist>? wishlist;

  GetWishListModel({this.wishlist});

  GetWishListModel.fromJson(Map<String, dynamic> json) {
    if (json['wishlist'] != null) {
      wishlist = <Wishlist>[];
      json['wishlist'].forEach((v) {
        wishlist!.add(new Wishlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wishlist != null) {
      data['wishlist'] = this.wishlist!.map((v) => v.toJson()).toList();
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
  dynamic? regularPrice;
  dynamic? salePrice;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['company_id'] = this.companyId;
    data['company_logo_link'] = this.companyLogoLink;
    data['company_display_name'] = this.companyDisplayName;
    data['product_id'] = this.productId;
    data['product_image_link'] = this.productImageLink;
    data['product_title'] = this.productTitle;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['currency'] = this.currency;
    data['id'] = this.id;
    return data;
  }
}
