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

class KurirToko {
  final int id;
  final int tokoId;
  final String namaKurir;
  final int hargaOngkir;
  final bool isActive;
  final DateTime createdAt;

  KurirToko({
    required this.id,
    required this.tokoId,
    required this.namaKurir,
    required this.hargaOngkir,
    required this.isActive,
    required this.createdAt,
  });

  factory KurirToko.fromJson(Map<String, dynamic> json) {
    return KurirToko(
      id: json['id'],
      tokoId: json['toko_id'],
      namaKurir: json['nama_kurir'],
      hargaOngkir: json['harga_ongkir'],
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'toko_id': tokoId,
      'nama_kurir': namaKurir,
      'harga_ongkir': hargaOngkir,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
