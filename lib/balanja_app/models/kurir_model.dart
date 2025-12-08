class Kurir {
  String courierCode;
  String courierName;
  String courierServiceCode;
  String serviceName;
  String description;
  String duration;
  int price;

  Kurir({
    required this.courierCode,
    required this.courierName,
    required this.courierServiceCode,
    required this.serviceName,
    required this.description,
    required this.duration,
    required this.price,
  });

  factory Kurir.fromJson(Map<String, dynamic> json) {
    return Kurir(
      courierCode: json['courier_code'],
      courierName: json['courier_name'],
      courierServiceCode: json['courier_service_code'],
      serviceName: json['service_name'],
      description: json['description'],
      duration: json['duration'],
      price: json['price'],
    );
  }
}
