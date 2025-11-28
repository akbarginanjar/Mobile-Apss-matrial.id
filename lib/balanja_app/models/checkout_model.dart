class Checkout {
  int? id;
  String? noInvoice;
  String? waktuTransaksi;
  String? metodeBayar;
  int? uangMasuk;
  int? ongkir;
  int? totalBayar;
  String? statusBayar;
  String? status;
  String? kodeBayar;
  KodeBayarDetail? kodeBayarDetail;
  int? kodeUnik;
  String? shipmentOption;
  String? expireTime;
  Member? member;
  List<Item>? item;
  Customer? customer;
  BuktiTf? buktiTf;

  Checkout(
      {this.id,
      this.noInvoice,
      this.waktuTransaksi,
      this.metodeBayar,
      this.uangMasuk,
      this.ongkir,
      this.totalBayar,
      this.statusBayar,
      this.status,
      this.kodeBayar,
      this.kodeBayarDetail,
      this.kodeUnik,
      this.shipmentOption,
      this.expireTime,
      this.member,
      this.item,
      this.customer,
      this.buktiTf});

  Checkout.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noInvoice = json['no_invoice'];
    waktuTransaksi = json['waktu_transaksi'];
    metodeBayar = json['metode_bayar'];
    uangMasuk = json['uang_masuk'];
    ongkir = json['ongkir'];
    totalBayar = json['total_bayar'];
    statusBayar = json['status_bayar'];
    status = json['status'];
    kodeBayar = json['kode_bayar'];
    kodeBayarDetail = json['kode_bayar_detail'] != null
        ? KodeBayarDetail.fromJson(json['kode_bayar_detail'])
        : null;
    kodeUnik = json['kode_unik'];
    shipmentOption = json['shipment_option'];
    expireTime = json['expire_time'];
    member = json['member'] != null ? Member.fromJson(json['member']) : null;
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item!.add(Item.fromJson(v));
      });
    }
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    buktiTf =
        json['bukti_tf'] != null ? BuktiTf.fromJson(json['bukti_tf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['no_invoice'] = noInvoice;
    data['waktu_transaksi'] = waktuTransaksi;
    data['metode_bayar'] = metodeBayar;
    data['uang_masuk'] = uangMasuk;
    data['ongkir'] = ongkir;
    data['total_bayar'] = totalBayar;
    data['status_bayar'] = statusBayar;
    data['status'] = status;
    data['kode_bayar'] = kodeBayar;
    if (kodeBayarDetail != null) {
      data['kode_bayar_detail'] = kodeBayarDetail!.toJson();
    }
    data['kode_unik'] = kodeUnik;
    data['shipment_option'] = shipmentOption;
    data['expire_time'] = expireTime;
    if (member != null) {
      data['member'] = member!.toJson();
    }
    if (item != null) {
      data['item'] = item!.map((v) => v.toJson()).toList();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (buktiTf != null) {
      data['bukti_tf'] = buktiTf!.toJson();
    }
    return data;
  }
}

class KodeBayarDetail {
  int? id;
  String? nama;
  String? noRekening;
  String? deskripsi;
  String? imageUrl;

  KodeBayarDetail(
      {this.id, this.nama, this.noRekening, this.deskripsi, this.imageUrl});

  KodeBayarDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    noRekening = json['no_rekening'];
    deskripsi = json['deskripsi'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['no_rekening'] = noRekening;
    data['deskripsi'] = deskripsi;
    data['image_url'] = imageUrl;
    return data;
  }
}

class Member {
  int? id;
  String? namaLengkap;
  String? alamatGudang;

  Member({this.id, this.namaLengkap, this.alamatGudang});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaLengkap = json['nama_lengkap'];
    alamatGudang = json['alamat_gudang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_lengkap'] = namaLengkap;
    data['alamat_gudang'] = alamatGudang;
    return data;
  }
}

class Item {
  int? id;
  int? barangId;
  String? barangNama;
  String? berat;
  int? penyimpananId;
  int? qty;
  int? harga;
  int? totalHarga;

  Item(
      {this.id,
      this.barangId,
      this.barangNama,
      this.berat,
      this.penyimpananId,
      this.qty,
      this.harga,
      this.totalHarga});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barangId = json['barang_id'];
    barangNama = json['barang_nama'];
    berat = json['berat'];
    penyimpananId = json['penyimpanan_id'];
    qty = json['qty'];
    harga = json['harga'];
    totalHarga = json['total_harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['barang_id'] = barangId;
    data['barang_nama'] = barangNama;
    data['berat'] = berat;
    data['penyimpanan_id'] = penyimpananId;
    data['qty'] = qty;
    data['harga'] = harga;
    data['total_harga'] = totalHarga;
    return data;
  }
}

class Customer {
  String? nama;
  String? email;
  String? noHp;
  DataPengiriman? dataPengiriman;

  Customer({this.nama, this.email, this.noHp, this.dataPengiriman});

  Customer.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    email = json['email'];
    noHp = json['no_hp'];
    dataPengiriman = json['data_pengiriman'] != null
        ? DataPengiriman.fromJson(json['data_pengiriman'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['email'] = email;
    data['no_hp'] = noHp;
    if (dataPengiriman != null) {
      data['data_pengiriman'] = dataPengiriman!.toJson();
    }
    return data;
  }
}

class DataPengiriman {
  int? id;
  String? alamat;
  Provinsi? provinsi;
  KabKota? kabKota;
  Kecamatan? kecamatan;
  Desa? desa;

  DataPengiriman(
      {this.id,
      this.alamat,
      this.provinsi,
      this.kabKota,
      this.kecamatan,
      this.desa});

  DataPengiriman.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alamat = json['alamat'];
    provinsi =
        json['provinsi'] != null ? Provinsi.fromJson(json['provinsi']) : null;
    kabKota =
        json['kab_kota'] != null ? KabKota.fromJson(json['kab_kota']) : null;
    kecamatan = json['kecamatan'] != null
        ? Kecamatan.fromJson(json['kecamatan'])
        : null;
    desa = json['desa'] != null ? Desa.fromJson(json['desa']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['alamat'] = alamat;
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

class KabKota {
  int? id;
  int? idProvinsi;
  String? name;

  KabKota({this.id, this.idProvinsi, this.name});

  KabKota.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProvinsi = json['id_provinsi'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_provinsi'] = idProvinsi;
    data['name'] = name;
    return data;
  }
}

class Kecamatan {
  int? id;
  int? idKabKota;
  String? name;

  Kecamatan({this.id, this.idKabKota, this.name});

  Kecamatan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKabKota = json['id_kab_kota'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_kab_kota'] = idKabKota;
    data['name'] = name;
    return data;
  }
}

class Desa {
  int? id;
  int? idKecamatan;
  String? name;

  Desa({this.id, this.idKecamatan, this.name});

  Desa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKecamatan = json['id_kecamatan'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_kecamatan'] = idKecamatan;
    data['name'] = name;
    return data;
  }
}

class BuktiTf {
  int? id;
  int? transaksiId;
  int? rekeningId;
  String? file;
  String? createdAt;
  String? updatedAt;

  BuktiTf(
      {this.id,
      this.transaksiId,
      this.rekeningId,
      this.file,
      this.createdAt,
      this.updatedAt});

  BuktiTf.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transaksiId = json['transaksi_id'];
    rekeningId = json['rekening_id'];
    file = json['file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaksi_id'] = transaksiId;
    data['rekening_id'] = rekeningId;
    data['file'] = file;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
