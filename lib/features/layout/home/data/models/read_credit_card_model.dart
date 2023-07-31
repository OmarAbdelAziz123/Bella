class ReadCreditCardModel {
  List<LinkedCards>? linkedCards;

  ReadCreditCardModel({this.linkedCards});

  ReadCreditCardModel.fromJson(Map<String, dynamic> json) {
    if (json['linked_cards'] != null) {
      linkedCards = <LinkedCards>[];
      json['linked_cards'].forEach((v) {
        linkedCards!.add(LinkedCards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (linkedCards != null) {
      data['linked_cards'] = linkedCards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LinkedCards {
  String? cardNumber;
  String? expiryDate;
  String? cardType;

  LinkedCards({this.cardNumber, this.expiryDate, this.cardType});

  LinkedCards.fromJson(Map<String, dynamic> json) {
    cardNumber = json['card_number'];
    expiryDate = json['expiry_date'];
    cardType = json['card_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['card_number'] = cardNumber;
    data['expiry_date'] = expiryDate;
    data['card_type'] = cardType;
    return data;
  }
}
