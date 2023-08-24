class GetAllPersonalOffersByUserModel {
  PersonalOffers? personalOffers;

  GetAllPersonalOffersByUserModel({this.personalOffers});

  GetAllPersonalOffersByUserModel.fromJson(Map<String, dynamic> json) {
    personalOffers = json['personal_offers'] != null
        ? PersonalOffers.fromJson(json['personal_offers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (personalOffers != null) {
      data['personal_offers'] = personalOffers!.toJson();
    }
    return data;
  }
}

class PersonalOffers {
  List<PersonalOffer>? giftCards;
  List<PersonalOffer>? bonusCheck;
  List<PersonalOffer>? discountCodes;

  PersonalOffers({this.giftCards, this.bonusCheck, this.discountCodes});

  PersonalOffers.fromJson(Map<String, dynamic> json) {
    if (json['gift_cards'] != null) {
      giftCards = <PersonalOffer>[];
      json['gift_cards'].forEach((v) {
        giftCards!.add(PersonalOffer.fromJson(v));
      });
    }
    if (json['bonus_check'] != null) {
      bonusCheck = <PersonalOffer>[];
      json['bonus_check'].forEach((v) {
        bonusCheck!.add(PersonalOffer.fromJson(v));
      });
    }
    if (json['discount_codes'] != null) {
      discountCodes = <PersonalOffer>[];
      json['discount_codes'].forEach((v) {
        discountCodes!.add(PersonalOffer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (giftCards != null) {
      data['gift_cards'] = giftCards!.map((v) => v.toJson()).toList();
    }
    if (bonusCheck != null) {
      data['bonus_check'] = bonusCheck!.map((v) => v.toJson()).toList();
    }
    if (discountCodes != null) {
      data['discount_codes'] =
          discountCodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PersonalOffer {
  String? id;
  String? userId;
  String? title;
  Company? company;
  String? type;
  Value? value;
  bool? redeemed;
  String? redemptionDate;
  String? validTo;
  String? barcodeLink;
  Restrictions? restrictions;
  String? status;
  String? description;

  PersonalOffer(
      {this.id,
        this.userId,
        this.title,
        this.company,
        this.type,
        this.value,
        this.redeemed,
        this.redemptionDate,
        this.validTo,
        this.barcodeLink,
        this.restrictions,
        this.status,
        this.description});

  PersonalOffer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    company =
    json['company'] != null ? Company.fromJson(json['company']) : null;
    type = json['type'];
    value = json['value'] != null ? Value.fromJson(json['value']) : null;
    redeemed = json['redeemed'];
    redemptionDate = json['redemption_date'];
    validTo = json['valid_to'];
    barcodeLink = json['barcode_link'];
    restrictions = json['restrictions'] != null
        ? Restrictions.fromJson(json['restrictions'])
        : null;
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    data['type'] = type;
    if (value != null) {
      data['value'] = value!.toJson();
    }
    data['redeemed'] = redeemed;
    data['redemption_date'] = redemptionDate;
    data['valid_to'] = validTo;
    data['barcode_link'] = barcodeLink;
    if (restrictions != null) {
      data['restrictions'] = restrictions!.toJson();
    }
    data['status'] = status;
    data['description'] = description;
    return data;
  }
}

class Company {
  String? id;
  String? displayName;
  String? logo;

  Company({this.id, this.displayName, this.logo});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display_name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display_name'] = displayName;
    data['logo'] = logo;
    return data;
  }
}

class Value {
  int? amount;
  String? currency;
  String? code;

  Value({this.amount, this.currency, this.code});

  Value.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    data['code'] = code;
    return data;
  }
}

class Restrictions {
  int? minPurchase;
  List<String>? locations;
  String? termsAndConditions;

  Restrictions({this.minPurchase, this.locations, this.termsAndConditions});

  Restrictions.fromJson(Map<String, dynamic> json) {
    minPurchase = json['min_purchase'];
    locations = json['locations'].cast<String>();
    termsAndConditions = json['terms_and_conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min_purchase'] = minPurchase;
    data['locations'] = locations;
    data['terms_and_conditions'] = termsAndConditions;
    return data;
  }
}
