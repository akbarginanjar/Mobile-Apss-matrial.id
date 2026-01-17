class Produk {
  final int? id;
  final String? nama;
  final Kategori? kategori;
  final String? slug;
  final int? harga;
  final List<VarianBarang> varianBarang;

  Produk({
    this.id,
    this.nama,
    this.kategori,
    this.slug,
    this.harga,
    this.varianBarang = const [],
  });

  factory Produk.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Produk();

    return Produk(
      id: json['id'],
      nama: json['nama'],
      slug: json['slug'],
      harga: json['harga'],
      kategori: json['kategori'] != null
          ? Kategori.fromJson(json['kategori'])
          : null,
      varianBarang:
          (json['varian_barang'] as List?)
              ?.map((e) => VarianBarang.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Kategori {
  final int? id;
  final String? kategori;

  Kategori({this.id, this.kategori});

  factory Kategori.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Kategori();

    return Kategori(id: json['id'], kategori: json['kategori']);
  }
}

class VarianBarang {
  final int? id;
  final int? jumlah;
  final int? barangId;
  final int? gudangId;
  final Gudang? gudang;
  final String? nama;
  final String? kode;
  final String? varian;
  final String? deskripsi;
  final String? slug;
  final String? productType;
  final List<Photo> photo;
  final int? hargaCoret;
  final int? harga;
  final Satuan? satuan;
  final Kategori? kategori;
  final bool? isPreOrder;
  final int? preOrderDay;
  final String? berat;
  final bool? isWishlist;
  final bool? isFollowToko;

  VarianBarang({
    this.id,
    this.jumlah,
    this.barangId,
    this.gudangId,
    this.gudang,
    this.nama,
    this.kode,
    this.varian,
    this.deskripsi,
    this.slug,
    this.productType,
    this.photo = const [],
    this.hargaCoret,
    this.harga,
    this.satuan,
    this.kategori,
    this.isPreOrder,
    this.preOrderDay,
    this.berat,
    this.isWishlist,
    this.isFollowToko,
  });

  factory VarianBarang.fromJson(Map<String, dynamic>? json) {
    if (json == null) return VarianBarang();

    return VarianBarang(
      id: json['id'],
      jumlah: json['jumlah'] ?? 0,
      barangId: json['barang_id'],
      gudangId: json['gudang_id'],
      nama: json['nama'] ?? '',
      kode: json['kode'] ?? '',
      varian: json['varian'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      slug: json['slug'] ?? '',
      productType: json['product_type'] ?? '',
      hargaCoret: json['harga_coret'] ?? 0,
      harga: json['harga'] ?? 0,
      berat: json['berat'] ?? '0',
      isPreOrder: json['is_pre_order'] ?? false,
      preOrderDay: json['pre_order_day'] ?? 0,
      isWishlist: json['is_wishlist'] ?? false,
      isFollowToko: json['is_follow_toko'] ?? false,
      gudang: json['gudang'] != null ? Gudang.fromJson(json['gudang']) : null,
      satuan: json['satuan'] != null ? Satuan.fromJson(json['satuan']) : null,
      kategori: json['kategori'] != null
          ? Kategori.fromJson(json['kategori'])
          : null,
      photo:
          (json['photo'] as List?)?.map((e) => Photo.fromJson(e)).toList() ??
          const [],
    );
  }
}

class Gudang {
  final int? id;
  final String? namaGudang;
  final String? alamat;
  final String? keterangan;
  final int? memberId;
  final String? sebagai;
  final Member? member;

  Gudang({
    this.id,
    this.namaGudang,
    this.alamat,
    this.keterangan,
    this.memberId,
    this.sebagai,
    this.member,
  });

  factory Gudang.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Gudang();

    return Gudang(
      id: json['id'],
      namaGudang: json['nama_gudang'],
      alamat: json['alamat'],
      keterangan: json['keterangan'],
      memberId: json['member_id'],
      sebagai: json['sebagai'],
      member: json['member'] != null ? Member.fromJson(json['member']) : null,
    );
  }
}

class Member {
  final int? id;
  final String? namaLengkap;

  Member({this.id, this.namaLengkap});

  factory Member.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Member();

    return Member(id: json['id'], namaLengkap: json['nama_lengkap']);
  }
}

class Photo {
  final int? id;
  final int? barangId;
  final String? photo;
  final int? tipe;
  final String? path;
  final String? tipeLabel;

  Photo({
    this.id,
    this.barangId,
    this.photo,
    this.tipe,
    this.path,
    this.tipeLabel,
  });

  factory Photo.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Photo();

    return Photo(
      id: json['id'],
      barangId: json['barang_id'],
      photo: json['photo'],
      tipe: json['tipe'],
      path: json['path'],
      tipeLabel: json['tipe_label'],
    );
  }
}

class Satuan {
  final int? id;
  final String? satuan;

  Satuan({this.id, this.satuan});

  factory Satuan.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Satuan();

    return Satuan(id: json['id'], satuan: json['satuan']);
  }
}

// class ProdukModel {
//   int? id;
//   String? nama;
//   KategoriModel? kategori;
//   String? slug;
//   int? harga;
//   List<VarianBarangModel>? varianBarang;

//   ProdukModel({
//     this.id,
//     this.nama,
//     this.kategori,
//     this.slug,
//     this.harga,
//     this.varianBarang,
//   });

//   factory ProdukModel.fromJson(Map<String, dynamic>? json) {
//     if (json == null) return ProdukModel();

//     return ProdukModel(
//       id: json['id'],
//       nama: json['nama'] ?? '',
//       kategori: KategoriModel.fromJson(json['kategori']),
//       slug: json['slug'] ?? '',
//       harga: json['harga'] ?? 0,
//       varianBarang:
//           (json['varian_barang'] as List?)
//               ?.map((e) => VarianBarangModel.fromJson(e))
//               .toList() ??
//           [],
//     );
//   }
// }

// class KategoriModel {
//   int? id;
//   String? kategori;

//   KategoriModel({this.id, this.kategori});

//   factory KategoriModel.fromJson(Map<String, dynamic>? json) {
//     if (json == null) return KategoriModel();

//     return KategoriModel(id: json['id'], kategori: json['kategori'] ?? '');
//   }
// }

// class VarianBarangModel {
//   int? id;
//   int? jumlah;
//   int? barangId;
//   int? gudangId;
//   GudangModel? gudang;
//   String? nama;
//   String? kode;
//   String? varian;
//   String? deskripsi;
//   String? slug;
//   String? productType;
//   List<PhotoModel>? photo;
//   int? hargaCoret;
//   int? harga;
//   SatuanModel? satuan;
//   KategoriModel? kategori;
//   bool? isPreOrder;
//   int? preOrderDay;
//   String? berat;
//   bool? isWishlist;
//   bool? isFollowToko;

//   VarianBarangModel({
//     this.id,
//     this.jumlah,
//     this.barangId,
//     this.gudangId,
//     this.gudang,
//     this.nama,
//     this.kode,
//     this.varian,
//     this.deskripsi,
//     this.slug,
//     this.productType,
//     this.photo,
//     this.hargaCoret,
//     this.harga,
//     this.satuan,
//     this.kategori,
//     this.isPreOrder,
//     this.preOrderDay,
//     this.berat,
//     this.isWishlist,
//     this.isFollowToko,
//   });

//   factory VarianBarangModel.fromJson(Map<String, dynamic>? json) {
//     if (json == null) return VarianBarangModel();

//     return VarianBarangModel(
//       id: json['id'],
//       jumlah: json['jumlah'] ?? 0,
//       barangId: json['barang_id'],
//       gudangId: json['gudang_id'],
//       gudang: GudangModel.fromJson(json['gudang']),
//       nama: json['nama'] ?? '',
//       kode: json['kode'] ?? '',
//       varian: json['varian'] ?? '',
//       deskripsi: json['deskripsi'] ?? '',
//       slug: json['slug'] ?? '',
//       productType: json['product_type'] ?? '',
//       photo:
//           (json['photo'] as List?)
//               ?.map((e) => PhotoModel.fromJson(e))
//               .toList() ??
//           [],
//       hargaCoret: json['harga_coret'] ?? 0,
//       harga: json['harga'] ?? 0,
//       satuan: SatuanModel.fromJson(json['satuan']),
//       kategori: KategoriModel.fromJson(json['kategori']),
//       isPreOrder: json['is_pre_order'] ?? false,
//       preOrderDay: json['pre_order_day'] ?? 0,
//       berat: json['berat'] ?? '0',
//       isWishlist: json['is_wishlist'] ?? false,
//       isFollowToko: json['is_follow_toko'] ?? false,
//     );
//   }
// }

// class GudangModel {
//   int? id;
//   String? namaGudang;
//   String? alamat;
//   String? keterangan;
//   int? memberId;
//   String? sebagai;
//   MemberModel? member;

//   GudangModel({
//     this.id,
//     this.namaGudang,
//     this.alamat,
//     this.keterangan,
//     this.memberId,
//     this.sebagai,
//     this.member,
//   });

//   factory GudangModel.fromJson(Map<String, dynamic>? json) {
//     if (json == null) return GudangModel();

//     return GudangModel(
//       id: json['id'],
//       namaGudang: json['nama_gudang'] ?? '',
//       alamat: json['alamat'] ?? '',
//       keterangan: json['keterangan'] ?? '',
//       memberId: json['member_id'],
//       sebagai: json['sebagai'] ?? '',
//       member: MemberModel.fromJson(json['member']),
//     );
//   }
// }

// class MemberModel {
//   int? id;
//   String? namaLengkap;

//   MemberModel({this.id, this.namaLengkap});

//   factory MemberModel.fromJson(Map<String, dynamic>? json) {
//     if (json == null) return MemberModel();

//     return MemberModel(id: json['id'], namaLengkap: json['nama_lengkap'] ?? '');
//   }
// }

// class PhotoModel {
//   int? id;
//   int? barangId;
//   String? photo;
//   int? tipe;
//   String? path;
//   String? tipeLabel;

//   PhotoModel({
//     this.id,
//     this.barangId,
//     this.photo,
//     this.tipe,
//     this.path,
//     this.tipeLabel,
//   });

//   factory PhotoModel.fromJson(Map<String, dynamic>? json) {
//     if (json == null) return PhotoModel();

//     return PhotoModel(
//       id: json['id'],
//       barangId: json['barang_id'],
//       photo: json['photo'] ?? '',
//       tipe: json['tipe'],
//       path: json['path'] ?? '',
//       tipeLabel: json['tipe_label'] ?? '',
//     );
//   }
// }

// class SatuanModel {
//   int? id;
//   String? satuan;

//   SatuanModel({this.id, this.satuan});

//   factory SatuanModel.fromJson(Map<String, dynamic>? json) {
//     if (json == null) return SatuanModel();

//     return SatuanModel(id: json['id'], satuan: json['satuan'] ?? '');
//   }
// }

// //OLD
// class Produk {
//   int? id;
//   int? gudangId;
//   int? memberId;
//   String? nama;
//   String? slug;
//   bool? isWishlist;
//   List<Photo>? photo;
//   List<HargaJual>? hargaJual;
//   int? harga;
//   int? hargaCoret;
//   List<VarianBarang>? varianBarang;

//   Produk({
//     this.id,
//     this.gudangId,
//     this.memberId,
//     this.nama,
//     this.slug,
//     this.isWishlist,
//     this.photo,
//     this.hargaJual,
//     this.harga,
//     this.hargaCoret,
//     this.varianBarang,
//   });

//   Produk.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     gudangId = json['gudang_id'];
//     memberId = json['member_id'];
//     nama = json['nama'] is String ? json['nama'] : null;
//     slug = json['slug'] is String ? json['slug'] : null;
//     isWishlist = json['is_wishlist'] is bool ? json['is_wishlist'] : null;

//     if (json['photo'] != null) {
//       photo = <Photo>[];
//       json['photo'].forEach((v) {
//         photo!.add(Photo.fromJson(v));
//       });
//     }
//     if (json['harga_jual'] != null) {
//       hargaJual = <HargaJual>[];
//       json['harga_jual'].forEach((v) {
//         hargaJual!.add(HargaJual.fromJson(v));
//       });
//     }
//     harga = json['harga'];
//     hargaCoret = json['harga_coret'];
//     if (json['varian_barang'] != null) {
//       varianBarang = <VarianBarang>[];
//       json['varian_barang'].forEach((v) {
//         varianBarang!.add(VarianBarang.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['gudang_id'] = gudangId;
//     data['member_id'] = memberId;
//     data['nama'] = nama;
//     data['slug'] = slug;
//     data['is_wishlist'] = isWishlist;
//     if (photo != null) {
//       data['photo'] = photo!.map((v) => v.toJson()).toList();
//     }
//     if (hargaJual != null) {
//       data['harga_jual'] = hargaJual!.map((v) => v.toJson()).toList();
//     }
//     data['harga'] = harga;
//     data['harga_coret'] = hargaCoret;
//     if (varianBarang != null) {
//       data['varian_barang'] = varianBarang!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Photo {
//   int? id;
//   int? barangId;
//   String? photo;
//   int? tipe;
//   String? path;

//   Photo({this.id, this.barangId, this.photo, this.tipe, this.path});

//   Photo.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     barangId = json['barang_id'];
//     photo = json['photo'] is String ? json['photo'] : null;
//     tipe = json['tipe'];
//     path = json['path'] is String ? json['path'] : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['barang_id'] = barangId;
//     data['photo'] = photo;
//     data['tipe'] = tipe;
//     data['path'] = path;
//     return data;
//   }
// }

// class HargaJual {
//   int? id;
//   int? barangId;
//   int? tipeKonsumenId;
//   int? satuanId;
//   int? shareJasa;
//   int? sharePenjual;
//   int? harga;
//   Tipe? tipe;
//   Satuan? satuan;

//   HargaJual({
//     this.id,
//     this.barangId,
//     this.tipeKonsumenId,
//     this.satuanId,
//     this.shareJasa,
//     this.sharePenjual,
//     this.harga,
//     this.tipe,
//     this.satuan,
//   });

//   HargaJual.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     barangId = json['barang_id'];
//     tipeKonsumenId = json['tipe_konsumen_id'];
//     satuanId = json['satuan_id'];
//     shareJasa = json['share_jasa'];
//     sharePenjual = json['share_penjual'];
//     harga = json['harga'];
//     tipe = json['tipe'] != null ? Tipe.fromJson(json['tipe']) : null;
//     satuan = json['satuan'] != null ? Satuan.fromJson(json['satuan']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['barang_id'] = barangId;
//     data['tipe_konsumen_id'] = tipeKonsumenId;
//     data['satuan_id'] = satuanId;
//     data['share_jasa'] = shareJasa;
//     data['share_penjual'] = sharePenjual;
//     data['harga'] = harga;
//     if (tipe != null) {
//       data['tipe'] = tipe!.toJson();
//     }
//     if (satuan != null) {
//       data['satuan'] = satuan!.toJson();
//     }
//     return data;
//   }
// }

// class Tipe {
//   int? id;
//   String? nama;

//   Tipe({this.id, this.nama});

//   Tipe.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     // Pengecekan tipe aman untuk String
//     nama = json['nama'] is String ? json['nama'] : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['nama'] = nama;
//     return data;
//   }
// }

// class Satuan {
//   int? id;
//   String? satuan;

//   Satuan({this.id, this.satuan});

//   Satuan.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     // Pengecekan tipe aman untuk String
//     satuan = json['satuan'] is String ? json['satuan'] : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['satuan'] = satuan;
//     return data;
//   }
// }

// class VarianBarang {
//   int? id;
//   int? gudangId;
//   int? barangId;
//   int? jumlah;
//   int? memberId;
//   String? konversiKet;
//   Barang? barang;
//   Gudang? gudang;
//   Blok? blok;
//   String? palet;
//   String? rak;
//   String? laci;
//   int? harga;

//   VarianBarang({
//     this.id,
//     this.gudangId,
//     this.barangId,
//     this.jumlah,
//     this.memberId,
//     this.konversiKet,
//     this.barang,
//     this.gudang,
//     this.blok,
//     this.palet,
//     this.rak,
//     this.laci,
//     this.harga,
//   });

//   VarianBarang.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     gudangId = json['gudang_id'];
//     barangId = json['barang_id'];
//     jumlah = json['jumlah'];
//     memberId = json['member_id'];
//     konversiKet = json['konversi_ket'] is String ? json['konversi_ket'] : null;
//     barang = json['barang'] != null ? Barang.fromJson(json['barang']) : null;
//     gudang = json['gudang'] != null ? Gudang.fromJson(json['gudang']) : null;
//     blok = json['blok'] != null ? Blok.fromJson(json['blok']) : null;

//     palet = json['palet'] is String ? json['palet'] : null;
//     rak = json['rak'] is String ? json['rak'] : null;
//     laci = json['laci'] is String ? json['laci'] : null;

//     harga = json['harga'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['gudang_id'] = gudangId;
//     data['barang_id'] = barangId;
//     data['jumlah'] = jumlah;
//     data['member_id'] = memberId;
//     data['konversi_ket'] = konversiKet;
//     if (barang != null) {
//       data['barang'] = barang!.toJson();
//     }
//     if (gudang != null) {
//       data['gudang'] = gudang!.toJson();
//     }
//     if (blok != null) {
//       data['blok'] = blok!.toJson();
//     }
//     data['palet'] = palet;
//     data['rak'] = rak;
//     data['laci'] = laci;
//     data['harga'] = harga;
//     return data;
//   }
// }

// class Barang {
//   int? id;
//   int? idSatuan;
//   String? kode;
//   String? nama;
//   String? varian;
//   int? jenis;
//   String? headId;
//   String? generik;
//   int? narkotik;
//   String? klasifikasiUsia;
//   int? milik;
//   int? kelompokId;
//   int? jenisObat;
//   String? expireDate;
//   int? kondisi;
//   String? deskripsi;
//   int? minPesanan;
//   String? berat;
//   int? panjang;
//   int? lebar;
//   int? tinggi;
//   int? asuransiPengiriman;
//   int? statusOrder;
//   int? waktuPreorder;
//   int? publish;
//   String? kandungan;
//   String? noBatch;
//   bool? isConsignment;
//   bool? isPreOrder;
//   int? preOrderDay;
//   int? memberId;
//   bool? showToOthers;
//   String? slug;
//   List<VarianItem>? varianItem;
//   String? share;
//   Satuan? satuan;
//   Kategori? kategori;
//   List<HargaJual>? hargaJual;
//   List<dynamic>? jenisPenyakit;
//   List<dynamic>? layananEkspedisi;
//   List<Konversi>? konversi;
//   List<Photo>? photo;

//   Barang({
//     this.id,
//     this.idSatuan,
//     this.kode,
//     this.nama,
//     this.varian,
//     this.jenis,
//     this.headId,
//     this.generik,
//     this.narkotik,
//     this.klasifikasiUsia,
//     this.milik,
//     this.kelompokId,
//     this.jenisObat,
//     this.expireDate,
//     this.kondisi,
//     this.deskripsi,
//     this.minPesanan,
//     this.berat,
//     this.panjang,
//     this.lebar,
//     this.tinggi,
//     this.asuransiPengiriman,
//     this.statusOrder,
//     this.waktuPreorder,
//     this.publish,
//     this.kandungan,
//     this.noBatch,
//     this.isConsignment,
//     this.isPreOrder,
//     this.preOrderDay,
//     this.memberId,
//     this.showToOthers,
//     this.slug,
//     this.varianItem,
//     this.share,
//     this.satuan,
//     this.kategori,
//     this.hargaJual,
//     this.jenisPenyakit,
//     this.layananEkspedisi,
//     this.konversi,
//     this.photo,
//   });

//   Barang.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     idSatuan = json['id_satuan'];
//     kode = json['kode'] is String ? json['kode'] : null;
//     nama = json['nama'] is String ? json['nama'] : null;
//     varian = json['varian'] is String ? json['varian'] : null;

//     jenis = json['jenis'];

//     headId = json['head_id'] is String ? json['head_id'] : null;
//     generik = json['generik'] is String ? json['generik'] : null;

//     narkotik = json['narkotik'];

//     klasifikasiUsia = json['klasifikasi_usia'] is String
//         ? json['klasifikasi_usia']
//         : null;

//     milik = json['milik'];
//     kelompokId = json['kelompok_id'];
//     jenisObat = json['jenis_obat'];

//     expireDate = json['expire_date'] is String ? json['expire_date'] : null;

//     kondisi = json['kondisi'];

//     deskripsi = json['deskripsi'] is String ? json['deskripsi'] : null;

//     minPesanan = json['min_pesanan'];

//     berat = json['berat'] is String ? json['berat'] : null;

//     panjang = json['panjang'];
//     lebar = json['lebar'];
//     tinggi = json['tinggi'];
//     asuransiPengiriman = json['asuransi_pengiriman'];
//     statusOrder = json['status_order'];
//     waktuPreorder = json['waktu_preorder'];
//     publish = json['publish'];

//     kandungan = json['kandungan'] is String ? json['kandungan'] : null;
//     noBatch = json['no_batch'] is String ? json['no_batch'] : null;

//     isConsignment = json['is_consignment'];
//     isPreOrder = json['is_pre_order'];
//     preOrderDay = json['pre_order_day'];
//     memberId = json['member_id'];
//     isConsignment =
//         json['is_consignment']; // Duplikat field, tapi biarkan sesuai aslinya
//     showToOthers = json['show_to_others'];
//     slug = json['slug'] is String ? json['slug'] : null;

//     if (json['varian_item'] != null) {
//       varianItem = <VarianItem>[];
//       json['varian_item'].forEach((v) {
//         varianItem!.add(VarianItem.fromJson(v));
//       });
//     }

//     share = json['share'] is String ? json['share'] : null;

//     satuan = json['satuan'] != null ? Satuan.fromJson(json['satuan']) : null;
//     kategori = json['kategori'] != null
//         ? Kategori.fromJson(json['kategori'])
//         : null;
//     if (json['harga_jual'] != null) {
//       hargaJual = <HargaJual>[];
//       json['harga_jual'].forEach((v) {
//         hargaJual!.add(HargaJual.fromJson(v));
//       });
//     }

//     jenisPenyakit = json['jenis_penyakit'] as List<dynamic>?;
//     layananEkspedisi = json['layanan_ekspedisi'] as List<dynamic>?;

//     if (json['konversi'] != null) {
//       konversi = <Konversi>[];
//       json['konversi'].forEach((v) {
//         konversi!.add(Konversi.fromJson(v));
//       });
//     }
//     if (json['photo'] != null) {
//       photo = <Photo>[];
//       json['photo'].forEach((v) {
//         photo!.add(Photo.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['id_satuan'] = idSatuan;
//     data['kode'] = kode;
//     data['nama'] = nama;
//     data['varian'] = varian;
//     data['jenis'] = jenis;
//     data['head_id'] = headId;
//     data['generik'] = generik;
//     data['narkotik'] = narkotik;
//     data['klasifikasi_usia'] = klasifikasiUsia;
//     data['milik'] = milik;
//     data['kelompok_id'] = kelompokId;
//     data['jenis_obat'] = jenisObat;
//     data['expire_date'] = expireDate;
//     data['kondisi'] = kondisi;
//     data['deskripsi'] = deskripsi;
//     data['min_pesanan'] = minPesanan;
//     data['berat'] = berat;
//     data['panjang'] = panjang;
//     data['lebar'] = lebar;
//     data['tinggi'] = tinggi;
//     data['asuransi_pengiriman'] = asuransiPengiriman;
//     data['status_order'] = statusOrder;
//     data['waktu_preorder'] = waktuPreorder;
//     data['publish'] = publish;
//     data['kandungan'] = kandungan;
//     data['no_batch'] = noBatch;
//     data['is_consignment'] = isConsignment;
//     data['is_pre_order'] = isPreOrder;
//     data['pre_order_day'] = preOrderDay;
//     data['member_id'] = memberId;
//     data['show_to_others'] = showToOthers;
//     data['slug'] = slug;
//     if (varianItem != null) {
//       data['varian_item'] = varianItem!.map((v) => v.toJson()).toList();
//     }
//     data['share'] = share;
//     if (satuan != null) {
//       data['satuan'] = satuan!.toJson();
//     }
//     if (kategori != null) {
//       data['kategori'] = kategori!.toJson();
//     }
//     if (hargaJual != null) {
//       data['harga_jual'] = hargaJual!.map((v) => v.toJson()).toList();
//     }
//     if (konversi != null) {
//       data['konversi'] = konversi!.map((v) => v.toJson()).toList();
//     }
//     if (photo != null) {
//       data['photo'] = photo!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class VarianItem {
//   int? barangId;
//   int? satuanId;
//   String? kode;
//   String? noBatch;
//   String? varian;
//   String? expireDate;
//   int? harga;

//   VarianItem({
//     this.barangId,
//     this.satuanId,
//     this.kode,
//     this.noBatch,
//     this.varian,
//     this.expireDate,
//     this.harga,
//   });

//   VarianItem.fromJson(Map<String, dynamic> json) {
//     barangId = json['barang_id'];
//     satuanId = json['satuan_id'];
//     kode = json['kode'] is String ? json['kode'] : null;
//     noBatch = json['no_batch'] is String ? json['no_batch'] : null;
//     varian = json['varian'] is String ? json['varian'] : null;
//     expireDate = json['expire_date'] is String ? json['expire_date'] : null;

//     harga = json['harga'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['barang_id'] = barangId;
//     data['satuan_id'] = satuanId;
//     data['kode'] = kode;
//     data['no_batch'] = noBatch;
//     data['varian'] = varian;
//     data['expire_date'] = expireDate;
//     data['harga'] = harga;
//     return data;
//   }
// }

// class Kategori {
//   int? id;
//   String? kategori;

//   Kategori({this.id, this.kategori});

//   Kategori.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     kategori = json['kategori'] is String ? json['kategori'] : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['kategori'] = kategori;
//     return data;
//   }
// }

// class Konversi {
//   int? id;
//   int? idBarang;
//   int? idSatuan;
//   int? nilai;
//   Satuan? satuan;

//   Konversi({this.id, this.idBarang, this.idSatuan, this.nilai, this.satuan});

//   Konversi.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     idBarang = json['id_barang'];
//     idSatuan = json['id_satuan'];
//     nilai = json['nilai'];
//     satuan = json['satuan'] != null ? Satuan.fromJson(json['satuan']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['id_barang'] = idBarang;
//     data['id_satuan'] = idSatuan;
//     data['nilai'] = nilai;
//     if (satuan != null) {
//       data['satuan'] = satuan!.toJson();
//     }
//     return data;
//   }
// }

// class Gudang {
//   int? id;
//   int? jenis;
//   String? namaGudang;
//   String? alamat;
//   String? keterangan;
//   int? ruteId;
//   int? memberId;
//   String? sebagai;
//   Member? member;
//   String? karyawan;
//   String? kendaraan;
//   String? rute;

//   Gudang({
//     this.id,
//     this.jenis,
//     this.namaGudang,
//     this.alamat,
//     this.keterangan,
//     this.ruteId,
//     this.memberId,
//     this.sebagai,
//     this.member,
//     this.karyawan,
//     this.kendaraan,
//     this.rute,
//   });

//   Gudang.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     jenis = json['jenis'];
//     namaGudang = json['nama_gudang'] is String ? json['nama_gudang'] : null;
//     alamat = json['alamat'] is String ? json['alamat'] : null;
//     keterangan = json['keterangan'] is String ? json['keterangan'] : null;

//     ruteId = json['rute_id'];
//     memberId = json['member_id'];

//     sebagai = json['sebagai'] is String ? json['sebagai'] : null;

//     // member = json['member'] != null ? Member.fromJson(json['member']) : null;

//     karyawan = json['karyawan'] is String ? json['karyawan'] : null;
//     kendaraan = json['kendaraan'] is String ? json['kendaraan'] : null;
//     rute = json['rute'] is String ? json['rute'] : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['jenis'] = jenis;
//     data['nama_gudang'] = namaGudang;
//     data['alamat'] = alamat;
//     data['keterangan'] = keterangan;
//     data['rute_id'] = ruteId;
//     data['member_id'] = memberId;
//     data['sebagai'] = sebagai;
//     if (member != null) {
//       data['member'] = member!.toJson();
//     }
//     data['karyawan'] = karyawan;
//     data['kendaraan'] = kendaraan;
//     data['rute'] = rute;
//     return data;
//   }
// }

// class Member {
//   int? id;
//   String? namaLengkap;
//   int? jk;
//   String? noHp;
//   String? email;
//   int? provinsiId;
//   int? kabKotaId;
//   int? kecamatanId;
//   int? kelurahanId;
//   String? sebagai;
//   int? status;
//   String? alamat;
//   String? sellerid;
//   String? card;
//   String? ig;
//   String? wa;
//   List<Wilayah>? wilayah;
//   String? provinsi;
//   String? kabKota;
//   String? kecamatan;
//   String? kelurahan;

//   Member({
//     this.id,
//     this.namaLengkap,
//     this.jk,
//     this.noHp,
//     this.email,
//     this.provinsiId,
//     this.kabKotaId,
//     this.kecamatanId,
//     this.kelurahanId,
//     this.sebagai,
//     this.status,
//     this.alamat,
//     this.sellerid,
//     this.card,
//     this.ig,
//     this.wa,
//     this.wilayah,
//     this.provinsi,
//     this.kabKota,
//     this.kecamatan,
//     this.kelurahan,
//   });

//   Member.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     namaLengkap = json['nama_lengkap'] is String ? json['nama_lengkap'] : null;

//     jk = json['jk'];

//     noHp = json['no_hp'] is String ? json['no_hp'] : null;
//     email = json['email'] is String ? json['email'] : null;

//     provinsiId = json['provinsi_id'];
//     kabKotaId = json['kab_kota_id'];
//     kecamatanId = json['kecamatan_id'];
//     kelurahanId = json['kelurahan_id'];

//     sebagai = json['sebagai'] is String ? json['sebagai'] : null;

//     status = json['status'];

//     alamat = json['alamat'] is String ? json['alamat'] : null;
//     sellerid = json['sellerid'] is String ? json['sellerid'] : null;
//     card = json['card'] is String ? json['card'] : null;
//     ig = json['ig'] is String ? json['ig'] : null;
//     wa = json['wa'] is String ? json['wa'] : null;

//     if (json['wilayah'] != null) {
//       wilayah = <Wilayah>[];
//       json['wilayah'].forEach((v) {
//         wilayah!.add(Wilayah.fromJson(v));
//       });
//     }

//     provinsi = json['provinsi'] is String ? json['provinsi'] : null;
//     kabKota = json['kab_kota'] is String ? json['kab_kota'] : null;
//     kecamatan = json['kecamatan'] is String ? json['kecamatan'] : null;
//     kelurahan = json['kelurahan'] is String ? json['kelurahan'] : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['nama_lengkap'] = namaLengkap;
//     data['jk'] = jk;
//     data['no_hp'] = noHp;
//     data['email'] = email;
//     data['provinsi_id'] = provinsiId;
//     data['kab_kota_id'] = kabKotaId;
//     data['kecamatan_id'] = kecamatanId;
//     data['kelurahan_id'] = kelurahanId;
//     data['sebagai'] = sebagai;
//     data['status'] = status;
//     data['alamat'] = alamat;
//     data['sellerid'] = sellerid;
//     data['card'] = card;
//     data['ig'] = ig;
//     data['wa'] = wa;
//     if (wilayah != null) {
//       data['wilayah'] = wilayah!.map((v) => v.toJson()).toList();
//     }
//     data['provinsi'] = provinsi;
//     data['kab_kota'] = kabKota;
//     data['kecamatan'] = kecamatan;
//     data['kelurahan'] = kelurahan;
//     return data;
//   }
// }

// class Wilayah {
//   Cabang? cabang;

//   Wilayah({this.cabang});

//   Wilayah.fromJson(Map<String, dynamic> json) {
//     cabang = json['cabang'] != null ? Cabang.fromJson(json['cabang']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (cabang != null) {
//       data['cabang'] = cabang!.toJson();
//     }
//     return data;
//   }
// }

// class Cabang {
//   String? namaCabang;
//   String? namaTeritori;
//   String? keterangan;
//   String? namaKota;
//   List<dynamic>? anggota; // Diubah dari List<Null>? menjadi List<dynamic>?

//   Cabang({
//     this.namaCabang,
//     this.namaTeritori,
//     this.keterangan,
//     this.namaKota,
//     this.anggota,
//   });

//   Cabang.fromJson(Map<String, dynamic> json) {
//     namaCabang = json['nama_cabang'] is String ? json['nama_cabang'] : null;
//     namaTeritori = json['nama_teritori'] is String
//         ? json['nama_teritori']
//         : null;
//     keterangan = json['keterangan'] is String ? json['keterangan'] : null;
//     namaKota = json['nama_kota'] is String ? json['nama_kota'] : null;

//     anggota = json['anggota'] as List<dynamic>?;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['nama_cabang'] = namaCabang;
//     data['nama_teritori'] = namaTeritori;
//     data['keterangan'] = keterangan;
//     data['nama_kota'] = namaKota;
//     return data;
//   }
// }

// class Blok {
//   int? id;
//   int? gudangId;
//   String? blok;
//   String? createdAt;
//   String? updatedAt;
//   String? deletedAt;

//   Blok({
//     this.id,
//     this.gudangId,
//     this.blok,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });

//   Blok.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     gudangId = json['gudang_id'];
//     blok = json['blok'] is String ? json['blok'] : null;
//     createdAt = json['created_at'] is String ? json['created_at'] : null;
//     updatedAt = json['updated_at'] is String ? json['updated_at'] : null;
//     deletedAt = json['deleted_at'] is String ? json['deleted_at'] : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['gudang_id'] = gudangId;
//     data['blok'] = blok;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     return data;
//   }
// }
