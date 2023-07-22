class CompanyProfile {
  int? balance;
  String? unit;
  int? start;
  int? end;
  String? validTo;
  String? programType;
  List<Milestones>? milestones;

  CompanyProfile(
      {this.balance,
        this.unit,
        this.start,
        this.end,
        this.validTo,
        this.programType,
        this.milestones});

  CompanyProfile.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    unit = json['unit'];
    start = json['start'];
    end = json['end'];
    validTo = json['valid_to'];
    programType = json['program_type'];
    if (json['milestones'] != null) {
      milestones = <Milestones>[];
      json['milestones'].forEach((v) {
        milestones!.add(new Milestones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['unit'] = this.unit;
    data['start'] = this.start;
    data['end'] = this.end;
    data['valid_to'] = this.validTo;
    data['program_type'] = this.programType;
    if (this.milestones != null) {
      data['milestones'] = this.milestones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Milestones {
  String? name;
  int? limit;
  bool? reached;

  Milestones({this.name, this.limit, this.reached});

  Milestones.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    limit = json['limit'];
    reached = json['reached'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['limit'] = this.limit;
    data['reached'] = this.reached;
    return data;
  }
}
