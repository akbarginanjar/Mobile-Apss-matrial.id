class UlasanResponse {
  final Summary summary;
  final List<Ulasan> ulasans;

  UlasanResponse({required this.summary, required this.ulasans});

  factory UlasanResponse.fromJson(Map<String, dynamic> json) {
    return UlasanResponse(
      summary: Summary.fromJson(json['summary']),
      ulasans: (json['ulasans'] as List)
          .map((e) => Ulasan.fromJson(e))
          .toList(),
    );
  }
}

class Summary {
  final int rataRating;
  final int totalUlasan;

  Summary({required this.rataRating, required this.totalUlasan});

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      rataRating: json['rata_rating'],
      totalUlasan: json['total_ulasan'],
    );
  }
}

class Ulasan {
  final int rating;
  final String komentar;
  final String tanggal;
  final Member member;
  final List<MediaUlasan> media;

  Ulasan({
    required this.rating,
    required this.komentar,
    required this.tanggal,
    required this.member,
    required this.media,
  });

  factory Ulasan.fromJson(Map<String, dynamic> json) {
    return Ulasan(
      rating: json['rating'],
      komentar: json['komentar'],
      tanggal: json['tanggal'],
      member: Member.fromJson(json['member']),
      media: (json['media'] as List)
          .map((e) => MediaUlasan.fromJson(e))
          .toList(),
    );
  }
}

class Member {
  final String namaLengkap;

  Member({required this.namaLengkap});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(namaLengkap: json['nama_lengkap']);
  }
}

class MediaUlasan {
  final String url;

  MediaUlasan({required this.url});

  factory MediaUlasan.fromJson(Map<String, dynamic> json) {
    return MediaUlasan(url: json['url']);
  }
}
