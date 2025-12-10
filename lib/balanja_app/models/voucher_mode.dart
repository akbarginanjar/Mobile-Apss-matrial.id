class VoucherModel {
  int? id;
  String? name;
  String? ownedBy;
  String? member;
  String? type;
  int? value;

  VoucherModel({
    this.id,
    this.name,
    this.ownedBy,
    this.member,
    this.type,
    this.value,
  });

  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    return VoucherModel(
      id: json['id'],
      name: json['name'],
      ownedBy: json['owned_by'],
      member: json['member'],
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'owned_by': ownedBy,
      'member': member,
      'type': type,
      'value': value,
    };
  }
}
