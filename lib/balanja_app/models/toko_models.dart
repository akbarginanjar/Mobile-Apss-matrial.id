class Toko {
  int? id;
  String? namaTeritori;
  String? kotaKab;
  String? provinsi;
  String? namaCabang;
  String? wa;
  String? status;
  String? sellerid;
  String? card;
  String? ig;

  Toko({
    this.id,
    this.namaTeritori,
    this.kotaKab,
    this.provinsi,
    this.namaCabang,
    this.wa,
    this.status,
    this.sellerid,
    this.card,
    this.ig,
  });

  factory Toko.fromJson(Map<String, dynamic> json) {
    return Toko(
      id: json['id'] ?? 0,
      namaTeritori: json['nama_teritori'] ?? '',
      kotaKab: json['kota_kab'] ?? '',
      provinsi: json['provinsi'] ?? '',
      namaCabang: json['nama_cabang'] ?? '',
      wa: json['wa'] ?? '',
      status: json['status'] ?? '',
      sellerid: json['sellerid'] ?? '',
      card: json['card'] ?? '',
      ig: json['ig'] ?? '',
    );
  }
}
