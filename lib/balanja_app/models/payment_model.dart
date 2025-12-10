class PaymentMethodGroup {
  String group;
  List<dynamic> items;

  PaymentMethodGroup({required this.group, required this.items});

  factory PaymentMethodGroup.fromJson(Map<String, dynamic> json) {
    return PaymentMethodGroup(group: json['group'], items: json['items']);
  }
}
