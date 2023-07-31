class WishListModel {
  List<Wishlist2>? wishlist;

  WishListModel({this.wishlist});

  WishListModel.fromJson(Map<String, dynamic> json) {
    if (json['wishlist'] != null) {
      wishlist = <Wishlist2>[];
      json['wishlist'].forEach((v) {
        wishlist!.add(Wishlist2.fromJson(v));
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

class Wishlist2 {
  String? companyDisplayName;
  List<Products>? products;
  dynamic sum;

  Wishlist2({this.companyDisplayName, this.products, this.sum});

  Wishlist2.fromJson(Map<String, dynamic> json) {
    companyDisplayName = json['company_display_name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_display_name'] = companyDisplayName;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['sum'] = sum;
    return data;
  }
}

class Products {
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

  Products({
    this.userId,
    this.companyId,
    this.companyLogoLink,
    this.companyDisplayName,
    this.productId,
    this.productImageLink,
    this.productTitle,
    this.regularPrice,
    this.salePrice,
    this.currency,
    this.id,
  });

  Products.fromJson(Map<String, dynamic> json) {
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
