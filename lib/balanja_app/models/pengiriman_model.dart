class Pengiriman {
  String? name;
  List<Items>? items;

  Pengiriman({this.name, this.items});

  Pengiriman.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? name;
  String? description;
  String? valueShipmentOption;

  Items({this.name, this.description, this.valueShipmentOption});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    valueShipmentOption = json['value_shipment_option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['value_shipment_option'] = valueShipmentOption;
    return data;
  }
}
