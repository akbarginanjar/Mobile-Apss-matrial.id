class Transaksi {
  int? id;
  String? noInvoice;
  String? waktuTransaksi;
  int? memberId;
  int? alamatId;
  int? jasaKirimId;
  String? nama;
  String? email;
  String? noHp;
  String? metodeBayar;
  int? uangMasuk;
  int? ongkir;
  // int? diskon;
  int? totalBayar;
  String? expireTime;
  String? statusBayar;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? noResi;
  int? akunId;
  int? kasId;
  int? konsumenMemberId;
  Member? member;
  BuktiTf? buktiTf;

  Transaksi({
    this.id,
    this.noInvoice,
    this.waktuTransaksi,
    this.memberId,
    this.alamatId,
    this.jasaKirimId,
    this.nama,
    this.email,
    this.noHp,
    this.metodeBayar,
    this.uangMasuk,
    this.ongkir,
    // this.diskon,
    this.totalBayar,
    this.expireTime,
    this.statusBayar,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.noResi,
    this.akunId,
    this.kasId,
    this.konsumenMemberId,
    this.member,
    this.buktiTf,
  });

  Transaksi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noInvoice = json['no_invoice'];
    waktuTransaksi = json['waktu_transaksi'];
    memberId = json['member_id'];
    alamatId = json['alamat_id'];
    jasaKirimId = json['jasa_kirim_id'];
    nama = json['nama'];
    email = json['email'];
    noHp = json['no_hp'];
    metodeBayar = json['metode_bayar'];
    uangMasuk = json['uang_masuk'];
    ongkir = json['ongkir'];
    // diskon = json['diskon'];
    totalBayar = json['total_bayar'];
    expireTime = json['expire_time'];
    statusBayar = json['status_bayar'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    noResi = json['no_resi'];
    akunId = json['akun_id'];
    kasId = json['kas_id'];
    konsumenMemberId = json['konsumen_member_id'];
    member = json['member'] != null ? Member.fromJson(json['member']) : null;
    buktiTf = json['bukti_tf'] != null
        ? BuktiTf.fromJson(json['bukti_tf'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['no_invoice'] = noInvoice;
    data['waktu_transaksi'] = waktuTransaksi;
    data['member_id'] = memberId;
    data['alamat_id'] = alamatId;
    data['jasa_kirim_id'] = jasaKirimId;
    data['nama'] = nama;
    data['email'] = email;
    data['no_hp'] = noHp;
    data['metode_bayar'] = metodeBayar;
    data['uang_masuk'] = uangMasuk;
    data['ongkir'] = ongkir;
    // data['diskon'] = diskon;
    data['total_bayar'] = totalBayar;
    data['expire_time'] = expireTime;
    data['status_bayar'] = statusBayar;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['no_resi'] = noResi;
    data['akun_id'] = akunId;
    data['kas_id'] = kasId;
    data['konsumen_member_id'] = konsumenMemberId;
    if (member != null) {
      data['member'] = member!.toJson();
    }
    if (buktiTf != null) {
      data['bukti_tf'] = buktiTf!.toJson();
    }
    return data;
  }
}

class Member {
  String? namaLengkap;

  Member({this.namaLengkap});

  Member.fromJson(Map<String, dynamic> json) {
    namaLengkap = json['nama_lengkap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_lengkap'] = namaLengkap;
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

  BuktiTf({
    this.id,
    this.transaksiId,
    this.rekeningId,
    this.file,
    this.createdAt,
    this.updatedAt,
  });

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
