class BannerModel {
  final int id;
  final String foto;
  final bool status;

  BannerModel({this.id = 0, this.foto = '', this.status = false});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] ?? 0,
      foto: json['foto'] ?? '',
      status: json['status'] ?? false,
    );
  }
}
