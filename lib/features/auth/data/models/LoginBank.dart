class LoginBank {
  String? orderRef;
  String? autoStartToken;
  String? qrStartToken;
  String? qrStartSecret;

  LoginBank(
      {this.orderRef,
        this.autoStartToken,
        this.qrStartToken,
        this.qrStartSecret});

  LoginBank.fromJson(Map<String, dynamic> json) {
    orderRef = json['orderRef'];
    autoStartToken = json['autoStartToken'];
    qrStartToken = json['qrStartToken'];
    qrStartSecret = json['qrStartSecret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderRef'] = orderRef;
    data['autoStartToken'] = autoStartToken;
    data['qrStartToken'] = qrStartToken;
    data['qrStartSecret'] = qrStartSecret;
    return data;
  }
}
