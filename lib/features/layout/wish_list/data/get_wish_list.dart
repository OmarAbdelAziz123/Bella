// class WishlistItem {
//   final String userId;
//   final String companyId;
//   final String companyLogoLink;
//   final String companyDisplayName;
//   final String productId;
//   final String productImageLink;
//   final String productTitle;
//   final double regularPrice;
//   final double salePrice;
//   final String currency;
//   final String id;
//
//   WishlistItem({
//     required this.userId,
//     required this.companyId,
//     required this.companyLogoLink,
//     required this.companyDisplayName,
//     required this.productId,
//     required this.productImageLink,
//     required this.productTitle,
//     required this.regularPrice,
//     required this.salePrice,
//     required this.currency,
//     required this.id,
//   });
//
//   factory WishlistItem.fromJson(Map<String, dynamic> json) {
//     return WishlistItem(
//       userId: json['user_id'],
//       companyId: json['company_id'],
//       companyLogoLink: json['company_logo_link'],
//       companyDisplayName: json['company_display_name'],
//       productId: json['product_id'],
//       productImageLink: json['product_image_link'],
//       productTitle: json['product_title'],
//       regularPrice: json['regular_price'],
//       salePrice: json['sale_price'],
//       currency: json['currency'],
//       id: json['id'],
//     );
//   }
// }

class WishListModel {
  List<Wishlist2>? wishlist;

  WishListModel({this.wishlist});

  WishListModel.fromJson(Map<String, dynamic> json) {
    if (json['wishlist'] != null) {
      wishlist = <Wishlist2>[];
      json['wishlist'].forEach((v) {
        wishlist!.add(new Wishlist2.fromJson(v));
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

class Wishlist2 {
  String? companyDisplayName;
  List<Products>? products;
  dynamic? sum;

  Wishlist2({this.companyDisplayName, this.products, this.sum});

  Wishlist2.fromJson(Map<String, dynamic> json) {
    companyDisplayName = json['company_display_name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_display_name'] = this.companyDisplayName;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['sum'] = this.sum;
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
  dynamic? regularPrice;
  dynamic? salePrice;
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
