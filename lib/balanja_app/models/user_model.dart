class User {
  String? tokens;
  String? type;
  Data? data;
  List<Access>? access;

  User({this.tokens, this.type, this.data, this.access});

  User.fromJson(Map<String, dynamic> json) {
    tokens = json['tokens'];
    type = json['type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['access'] != null) {
      access = <Access>[];
      json['access'].forEach((v) {
        access!.add(Access.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tokens'] = tokens;
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (access != null) {
      data['access'] = access!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? noHp;
  String? email;
  String? pin;
  String? rememberToken;
  Karyawan? karyawan;
  Level? level;

  Data(
      {this.id,
      this.noHp,
      this.email,
      this.pin,
      this.rememberToken,
      this.karyawan,
      this.level});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noHp = json['no_hp'];
    email = json['email'];
    pin = json['pin'];
    rememberToken = json['remember_token'];
    karyawan =
        json['karyawan'] != null ? Karyawan.fromJson(json['karyawan']) : null;
    level = json['level'] != null ? Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['no_hp'] = noHp;
    data['email'] = email;
    data['pin'] = pin;
    data['remember_token'] = rememberToken;
    if (karyawan != null) {
      data['karyawan'] = karyawan!.toJson();
    }
    if (level != null) {
      data['level'] = level!.toJson();
    }
    return data;
  }
}

class Karyawan {
  int? id;
  int? jk;
  int? agama;
  int? statusPerkawinan;
  int? statusKaryawan;
  int? statusSp;
  String? kampusSekolah;
  String? pendidikanTerakhir;
  String? kualifikasiPendidikan;
  String? masaKerja;
  String? gradeKaryawan;
  String? fileFoto;
  String? tempatLahir;
  String? tanggalLahir;
  String? nik;
  String? nip;
  String? namaLengkap;
  String? noHp;
  String? email;
  String? alamat;
  String? tipe;
  String? sebagai;
  String? urlFoto;
  String? jkDef;
  String? agamaDef;
  Jabatan? jabatan;

  Karyawan(
      {this.id,
      this.jk,
      this.agama,
      this.statusPerkawinan,
      this.statusKaryawan,
      this.statusSp,
      this.kampusSekolah,
      this.pendidikanTerakhir,
      this.kualifikasiPendidikan,
      this.masaKerja,
      this.gradeKaryawan,
      this.fileFoto,
      this.tempatLahir,
      this.tanggalLahir,
      this.nik,
      this.nip,
      this.namaLengkap,
      this.noHp,
      this.email,
      this.alamat,
      this.tipe,
      this.sebagai,
      this.urlFoto,
      this.jkDef,
      this.agamaDef,
      this.jabatan});

  Karyawan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jk = json['jk'];
    agama = json['agama'];
    statusPerkawinan = json['status_perkawinan'];
    statusKaryawan = json['status_karyawan'];
    statusSp = json['status_sp'];
    kampusSekolah = json['kampus_sekolah'];
    pendidikanTerakhir = json['pendidikan_terakhir'];
    kualifikasiPendidikan = json['kualifikasi_pendidikan'];
    masaKerja = json['masa_kerja'];
    gradeKaryawan = json['grade_karyawan'];
    fileFoto = json['file_foto'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    nik = json['nik'];
    nip = json['nip'];
    namaLengkap = json['nama_lengkap'];
    noHp = json['no_hp'];
    email = json['email'];
    alamat = json['alamat'];
    tipe = json['tipe'];
    sebagai = json['sebagai'];
    urlFoto = json['url_foto'];
    jkDef = json['jk_def'];
    agamaDef = json['agama_def'];
    jabatan =
        json['jabatan'] != null ? Jabatan.fromJson(json['jabatan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['jk'] = jk;
    data['agama'] = agama;
    data['status_perkawinan'] = statusPerkawinan;
    data['status_karyawan'] = statusKaryawan;
    data['status_sp'] = statusSp;
    data['kampus_sekolah'] = kampusSekolah;
    data['pendidikan_terakhir'] = pendidikanTerakhir;
    data['kualifikasi_pendidikan'] = kualifikasiPendidikan;
    data['masa_kerja'] = masaKerja;
    data['grade_karyawan'] = gradeKaryawan;
    data['file_foto'] = fileFoto;
    data['tempat_lahir'] = tempatLahir;
    data['tanggal_lahir'] = tanggalLahir;
    data['nik'] = nik;
    data['nip'] = nip;
    data['nama_lengkap'] = namaLengkap;
    data['no_hp'] = noHp;
    data['email'] = email;
    data['alamat'] = alamat;
    data['tipe'] = tipe;
    data['sebagai'] = sebagai;
    data['url_foto'] = urlFoto;
    data['jk_def'] = jkDef;
    data['agama_def'] = agamaDef;
    if (jabatan != null) {
      data['jabatan'] = jabatan!.toJson();
    }
    return data;
  }
}

class Jabatan {
  int? id;
  String? namaJabatan;

  Jabatan({this.id, this.namaJabatan});

  Jabatan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaJabatan = json['nama_jabatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_jabatan'] = namaJabatan;
    return data;
  }
}

class Level {
  int? id;
  String? namaLevel;

  Level({this.id, this.namaLevel});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaLevel = json['nama_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_level'] = namaLevel;
    return data;
  }
}

class Access {
  int? urutan;
  String? name;
  String? icon;
  String? url;
  String? i18n;
  bool? create;
  bool? update;
  bool? delete;
  bool? filter;
  Menu? menu;
  String? status;
  Notifikasi? notifikasi;
  String? subMenu;

  Access(
      {this.urutan,
      this.name,
      this.icon,
      this.url,
      this.i18n,
      this.create,
      this.update,
      this.delete,
      this.filter,
      this.menu,
      this.status,
      this.notifikasi,
      this.subMenu});

  Access.fromJson(Map<String, dynamic> json) {
    urutan = json['urutan'];
    name = json['name'];
    icon = json['icon'];
    url = json['url'];
    i18n = json['i18n'];
    create = json['create'];
    update = json['update'];
    delete = json['delete'];
    filter = json['filter'];
    menu = json['menu'] != null ? Menu.fromJson(json['menu']) : null;
    status = json['status'];
    notifikasi = json['notifikasi'] != null
        ? Notifikasi.fromJson(json['notifikasi'])
        : null;
    subMenu = json['sub_menu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['urutan'] = urutan;
    data['name'] = name;
    data['icon'] = icon;
    data['url'] = url;
    data['i18n'] = i18n;
    data['create'] = create;
    data['update'] = update;
    data['delete'] = delete;
    data['filter'] = filter;
    if (menu != null) {
      data['menu'] = menu!.toJson();
    }
    data['status'] = status;
    if (notifikasi != null) {
      data['notifikasi'] = notifikasi!.toJson();
    }
    data['sub_menu'] = subMenu;
    return data;
  }
}

class Menu {
  int? id;
  int? urutan;
  String? name;
  String? icon;
  String? url;
  String? i18n;
  bool? create;
  bool? update;
  bool? delete;

  Menu(
      {this.id,
      this.urutan,
      this.name,
      this.icon,
      this.url,
      this.i18n,
      this.create,
      this.update,
      this.delete});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urutan = json['urutan'];
    name = json['name'];
    icon = json['icon'];
    url = json['url'];
    i18n = json['i18n'];
    create = json['create'];
    update = json['update'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['urutan'] = urutan;
    data['name'] = name;
    data['icon'] = icon;
    data['url'] = url;
    data['i18n'] = i18n;
    data['create'] = create;
    data['update'] = update;
    data['delete'] = delete;
    return data;
  }
}

class Notifikasi {
  String? notif;
  String? url;
  String? level;
  String? paramNotif;

  Notifikasi({this.notif, this.url, this.level, this.paramNotif});

  Notifikasi.fromJson(Map<String, dynamic> json) {
    notif = json['notif'];
    url = json['url'];
    level = json['level'];
    paramNotif = json['param_notif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notif'] = notif;
    data['url'] = url;
    data['level'] = level;
    data['param_notif'] = paramNotif;
    return data;
  }
}
