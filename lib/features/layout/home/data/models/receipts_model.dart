class ReceiptsModel {
  List<Receipts>? receipts;

  ReceiptsModel({this.receipts});

  ReceiptsModel.fromJson(Map<String, dynamic> json) {
    if (json['receipts'] != null) {
      receipts = <Receipts>[];
      json['receipts'].forEach((v) {
        receipts!.add(new Receipts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.receipts != null) {
      data['receipts'] = this.receipts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Receipts {
  String? id;
  String? date;
  Company? company;
  String? userId;
  int? total;
  List<Items>? items;

  Receipts(
      {this.id, this.date, this.company, this.userId, this.total, this.items});

  Receipts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    userId = json['user_id'];
    total = json['total'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['user_id'] = this.userId;
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Company {
  String? displayName;
  String? id;
  String? logo;
  String? storeName;

  Company({this.displayName, this.id, this.logo, this.storeName});

  Company.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    id = json['id'];
    logo = json['logo'];
    storeName = json['store_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this.displayName;
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['store_name'] = this.storeName;
    return data;
  }
}

class Items {
  String? name;
  int? quantity;
  int? price;
  int? total;

  Items({this.name, this.quantity, this.price, this.total});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total'] = this.total;
    return data;
  }
}
