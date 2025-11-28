class Bank {
  int? code;
  String? name;
  String? number;
  String? description;
  String? imageUrl;

  Bank({this.code, this.name, this.number, this.description, this.imageUrl});

  Bank.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    number = json['number'];
    description = json['description'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['number'] = number;
    data['description'] = description;
    data['image_url'] = imageUrl;
    return data;
  }
}
