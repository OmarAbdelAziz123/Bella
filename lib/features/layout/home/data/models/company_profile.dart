// ignore_for_file: non_constant_identifier_names

class CompanyProfile {
  int? balance = 0;
  bool? has_joined = false;
  String? unit = '';
  int? start = 0;
  int? end = 0;
  String? validTo = '';
  String? programType = '';
  bool? has_loyalty_program = false;
  List<Milestones>? milestones = [];

  CompanyProfile({
    this.balance,
    this.unit,
    this.start,
    this.has_joined,
    this.end,
    this.validTo,
    this.programType,
    this.has_loyalty_program,
    this.milestones,
  });

  CompanyProfile.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    unit = json['unit'];
    has_joined = json['has_joined'];
    start = json['start'] ?? 0;
    end = json['end'] ?? 0;
    validTo = json['valid_to'];
    programType = json['program_type'];
    has_loyalty_program = json['has_loyalty_program'];
    if (json['milestones'] != null) {
      milestones = <Milestones>[];
      json['milestones'].forEach((v) {
        milestones!.add(Milestones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['unit'] = unit;
    data['has_joined'] = has_joined;
    data['start'] = start;
    data['end'] = end;
    data['valid_to'] = validTo;
    data['program_type'] = programType;
    data['has_loyalty_program'] = has_loyalty_program;
    if (milestones != null) {
      data['milestones'] = milestones!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['limit'] = limit;
    data['reached'] = reached;
    return data;
  }
}
