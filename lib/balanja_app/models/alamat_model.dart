class Alamat {
  int? id;
  int? memberId;
  String? labelAlamat;
  int? provinsiId;
  int? kabKotaId;
  int? kecamatanId;
  int? desaId;
  String? alamat;
  String? nomorKontak;
  String? namaKontak;
  String? jenisAlamat;
  String? latitude;
  String? longitude;
  String? postalCode;
  String? catatan;
  String? createdAt;
  String? updatedAt;
  String? memberName;
  Provinsi? provinsi;
  Provinsi? kabKota;
  Provinsi? kecamatan;
  Provinsi? desa;

  Alamat({
    this.id,
    this.memberId,
    this.labelAlamat,
    this.provinsiId,
    this.kabKotaId,
    this.kecamatanId,
    this.desaId,
    this.alamat,
    this.nomorKontak,
    this.namaKontak,
    this.jenisAlamat,
    this.latitude,
    this.longitude,
    this.postalCode,
    this.catatan,
    this.createdAt,
    this.updatedAt,
    this.memberName,
    this.provinsi,
    this.kabKota,
    this.kecamatan,
    this.desa,
  });

  Alamat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    labelAlamat = json['label_alamat'];
    provinsiId = json['provinsi_id'];
    kabKotaId = json['kab_kota_id'];
    kecamatanId = json['kecamatan_id'];
    desaId = json['desa_id'];
    alamat = json['alamat'];
    nomorKontak = json['nomor_kontak'];
    namaKontak = json['nama_kontak'];
    jenisAlamat = json['jenis_alamat'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    postalCode = json['postal_code'];
    catatan = json['catatan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    memberName = json['member_name'];
    provinsi = json['provinsi'] != null
        ? Provinsi.fromJson(json['provinsi'])
        : null;
    kabKota = json['kab_kota'] != null
        ? Provinsi.fromJson(json['kab_kota'])
        : null;
    kecamatan = json['kecamatan'] != null
        ? Provinsi.fromJson(json['kecamatan'])
        : null;
    desa = json['desa'] != null ? Provinsi.fromJson(json['desa']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['label_alamat'] = labelAlamat;
    data['provinsi_id'] = provinsiId;
    data['kab_kota_id'] = kabKotaId;
    data['kecamatan_id'] = kecamatanId;
    data['desa_id'] = desaId;
    data['alamat'] = alamat;
    data['nomor_kontak'] = nomorKontak;
    data['nama_kontak'] = namaKontak;
    data['jenis_alamat'] = jenisAlamat;
    data['catatan'] = catatan;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['member_name'] = memberName;
    if (provinsi != null) {
      data['provinsi'] = provinsi!.toJson();
    }
    if (kabKota != null) {
      data['kab_kota'] = kabKota!.toJson();
    }
    if (kecamatan != null) {
      data['kecamatan'] = kecamatan!.toJson();
    }
    if (desa != null) {
      data['desa'] = desa!.toJson();
    }
    return data;
  }
}

class Provinsi {
  int? id;
  String? name;

  Provinsi({this.id, this.name});

  Provinsi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Province {
  final int id;
  final String name;

  Province({required this.id, required this.name});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(id: json['id'], name: json['name']);
  }
}

class KabKot {
  final int id;
  final String name;

  KabKot({required this.id, required this.name});

  factory KabKot.fromJson(Map<String, dynamic> json) {
    return KabKot(id: json['id'], name: json['name']);
  }
}

class Kacamatan {
  final int id;
  final String name;

  Kacamatan({required this.id, required this.name});

  factory Kacamatan.fromJson(Map<String, dynamic> json) {
    return Kacamatan(id: json['id'], name: json['name']);
  }
}

class KelurahanModel {
  final int id;
  final String name;

  KelurahanModel({required this.id, required this.name});

  factory KelurahanModel.fromJson(Map<String, dynamic> json) {
    return KelurahanModel(id: json['id'], name: json['name']);
  }
}
