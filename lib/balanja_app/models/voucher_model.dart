class Voucher {
  final int id;
  final String name;
  final String? ownedBy;
  final dynamic member;
  final String type;
  final int value;

  Voucher({
    required this.id,
    required this.name,
    required this.ownedBy,
    required this.member,
    required this.type,
    required this.value,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) {
    return Voucher(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id']}') ?? 0,
      name: json['name']?.toString() ?? '-',
      ownedBy: json['owned_by']?.toString(),
      member: json['member'],
      type: json['type']?.toString() ?? '',
      value: json['value'] is int
          ? json['value']
          : int.tryParse('${json['value']}') ?? 0,
    );
  }
}
