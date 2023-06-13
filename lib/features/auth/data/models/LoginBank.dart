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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderRef'] = this.orderRef;
    data['autoStartToken'] = this.autoStartToken;
    data['qrStartToken'] = this.qrStartToken;
    data['qrStartSecret'] = this.qrStartSecret;
    return data;
  }
}
