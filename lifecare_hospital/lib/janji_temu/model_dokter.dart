class Hari {
  int idHari;
  String namaHari;

  Hari({required this.idHari, required this.namaHari});

  factory Hari.fromJson(Map<String, dynamic> json) {
    return Hari(
      idHari: json['id_hari'],
      namaHari: json['nama_hari'],
    );
  }
}

class Spesialis {
  int idSpesialis;
  String namaSpesialis;

  Spesialis({required this.idSpesialis, required this.namaSpesialis});

  factory Spesialis.fromJson(Map<String, dynamic> json) {
    return Spesialis(
      idSpesialis: json['id_spesialis'],
      namaSpesialis: json['nama_spesialis'],
    );
  }
}

class Waktu {
  int idWaktu;
  String namaWaktu;

  Waktu({required this.idWaktu, required this.namaWaktu});

  factory Waktu.fromJson(Map<String, dynamic> json) {
    return Waktu(
      idWaktu: json['id_waktu'],
      namaWaktu: json['nama_waktu'],
    );
  }
}

class DokterAll {
  final String nama;
  final String spesialis;
  final List<String> hari;
  final String photoUrl; // Add the photoUrl property

  DokterAll({
    required this.nama,
    required this.spesialis,
    required this.hari,
    required this.photoUrl, // Initialize the photoUrl property
  });

  factory DokterAll.fromJson(Map<String, dynamic> json) {
    return DokterAll(
      nama: json['nama_dokter'],
      spesialis: json['spesialis'],
      hari: List<String>.from(json['hari']),
      photoUrl: json['foto_dokter'], // Provide the correct key for the photo URL
    );
  }
}



class ResponseBase {
  final String message;
  final List<Dokter> data;
  final bool error;

  ResponseBase({
    required this.message,
    required this.data,
    required this.error,
  });

  factory ResponseBase.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Dokter> dokterList = list.map((i) => Dokter.fromJson(i)).toList();

    return ResponseBase(
      message: json['message'],
      data: dokterList,
      error: json['error'],
    );
  }
}
class Dokter {
  int idDokter;
  String namaDokter;
  int idSpesialisD;
  String deskripsiDokter;
  String fotoDokter;
  Spesialis spesialis;
  List<DokterHariWaktu> jadwalRawatJalan;

  Dokter({
    required this.idDokter,
    required this.namaDokter,
    required this.idSpesialisD,
    required this.deskripsiDokter,
    required this.fotoDokter,
    required this.spesialis,
    required this.jadwalRawatJalan,
  });

  factory Dokter.fromJson(Map<String, dynamic> json) {
    return Dokter(
      idDokter: json['id_dokter'],
      namaDokter: json['nama_dokter'],
      idSpesialisD: json['id_spesialis_d'],
      deskripsiDokter: json['deskripsi_dokter'],
      fotoDokter: json['foto_dokter'],
      spesialis: Spesialis.fromJson(json['spesialis']),
      jadwalRawatJalan: (json['jadwal_rawat_jalan'] as List<dynamic>)
          .map((e) => DokterHariWaktu.fromJson(e))
          .toList(),
    );
  }
}

class DokterHariWaktu {
  int idDokterHariWaktu;
  int idDokter;
  int idHariD;
  int idWaktuD;
  Dokter dokter;
  Hari hari;
  Waktu waktu;

  DokterHariWaktu({
    required this.idDokterHariWaktu,
    required this.idDokter,
    required this.idHariD,
    required this.idWaktuD,
    required this.dokter,
    required this.hari,
    required this.waktu,
  });

  factory DokterHariWaktu.fromJson(Map<String, dynamic> json) {
    return DokterHariWaktu(
      idDokterHariWaktu: json['id_dokter_hari_waktu'],
      idDokter: json['id_dokter'],
      idHariD: json['id_hari_d'],
      idWaktuD: json['id_waktu_d'],
      dokter: Dokter.fromJson(json['dokter']),
      hari: Hari.fromJson(json['hari']),
      waktu: Waktu.fromJson(json['waktu']),
    );
  }
}
