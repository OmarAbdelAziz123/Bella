class CheckVerificationCodeModel {
  String? verificationStatus;

  CheckVerificationCodeModel({this.verificationStatus});

  CheckVerificationCodeModel.fromJson(Map<String, dynamic> json) {
    verificationStatus = json['verification_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verification_status'] = this.verificationStatus;
    return data;
  }
}