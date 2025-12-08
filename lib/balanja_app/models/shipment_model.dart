class ShipmentCategory {
  String? name;
  List<ShipmentItem>? items;

  ShipmentCategory({this.name, this.items});

  ShipmentCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['items'] != null) {
      items = (json['items'] as List)
          .map((e) => ShipmentItem.fromJson(e))
          .toList();
    }
  }
}

class ShipmentItem {
  String? id;
  String? name;
  String? description;

  ShipmentItem({this.id, this.name, this.description});

  ShipmentItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }
}
