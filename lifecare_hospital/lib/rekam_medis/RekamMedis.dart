import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart'; //import untuk pdf
import 'package:google_fonts/google_fonts.dart'; //import untuk font
import '../rekam_medis/pembayaran.dart';
import '../rekam_medis/PilihPasien.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Model untuk PilihPasien
class PilihPasien {
  final int id_pasien;
  final String nama_pasien;
  final DateTime tl_pasien;
  final String jk_pasien;

  PilihPasien({
    required this.id_pasien,
    required this.nama_pasien,
    required this.tl_pasien,
    required this.jk_pasien,
  });

  factory PilihPasien.fromJson(Map<String, dynamic> json) {
    return PilihPasien(
      id_pasien: json['id_pasien'],
      nama_pasien: json['nama_pasien'],
      tl_pasien: DateTime.parse(json['tl_pasien']),
      jk_pasien: json['jk_pasien'],
    );
  }
}

// Model untuk PasienRM
class PasienRM {
  final String nama_pasien;
  final DateTime tl_pasien;
  final String jk_pasien;

  PasienRM({
    required this.nama_pasien,
    required this.tl_pasien,
    required this.jk_pasien,
  });

  factory PasienRM.fromJson(Map<String, dynamic> json) {
    return PasienRM(
      nama_pasien: json['nama_pasien'],
      tl_pasien: DateTime.parse(json['tl_pasien']),
      jk_pasien: json['jk_pasien'],
    );
  }
}

// Model untuk SpesialisRM
class SpesialisRM {
  final String nama_spesialis;

  SpesialisRM({required this.nama_spesialis});

  factory SpesialisRM.fromJson(Map<String, dynamic> json) {
    return SpesialisRM(
      nama_spesialis: json['nama_spesialis'],
    );
  }
}

// Model untuk DokterRM
class DokterRM {
  final String nama_dokter;
  final SpesialisRM spesialis;

  DokterRM({required this.nama_dokter, required this.spesialis});

  factory DokterRM.fromJson(Map<String, dynamic> json) {
    return DokterRM(
      nama_dokter: json['nama_dokter'],
      spesialis: SpesialisRM.fromJson(json['spesialis']),
    );
  }
}

// Model untuk RekamMedisBase
class RekamMedisBase {
  final int id_invoice;
  final int bb_pasien;
  final String tekanan_darah;
  final String hasil_diagnosa;
  final String resep_obat;
  final int id_status_bayar_akhir;

  RekamMedisBase({
    required this.id_invoice,
    required this.bb_pasien,
    required this.tekanan_darah,
    required this.hasil_diagnosa,
    required this.resep_obat,
    required this.id_status_bayar_akhir,
  });

  factory RekamMedisBase.fromJson(Map<String, dynamic> json) {
    return RekamMedisBase(
      id_invoice: json['id_invoice'],
      bb_pasien: json['bb_pasien'],
      tekanan_darah: json['tekanan_darah'],
      hasil_diagnosa: json['hasil_diagnosa'],
      resep_obat: json['resep_obat'],
      id_status_bayar_akhir: json['id_status_bayar_akhir'],
    );
  }
}

// Model untuk RekamMedisCreate
class RekamMedisCreate extends RekamMedisBase {
  RekamMedisCreate({
    required int id_invoice,
    required int bb_pasien,
    required String tekanan_darah,
    required String hasil_diagnosa,
    required String resep_obat,
    required int id_status_bayar_akhir,
  }) : super(
          id_invoice: id_invoice,
          bb_pasien: bb_pasien,
          tekanan_darah: tekanan_darah,
          hasil_diagnosa: hasil_diagnosa,
          resep_obat: resep_obat,
          id_status_bayar_akhir: id_status_bayar_akhir,
        );
}

// Model untuk RekamMedis
class RekamMedis extends RekamMedisBase {
  final int id_rekammedis;
  final PasienRM pasien;
  final DokterRM dokter;

  RekamMedis({
    required this.id_rekammedis,
    required this.pasien,
    required this.dokter,
    required int id_invoice,
    required int bb_pasien,
    required String tekanan_darah,
    required String hasil_diagnosa,
    required String resep_obat,
    required int id_status_bayar_akhir,
  }) : super(
          id_invoice: id_invoice,
          bb_pasien: bb_pasien,
          tekanan_darah: tekanan_darah,
          hasil_diagnosa: hasil_diagnosa,
          resep_obat: resep_obat,
          id_status_bayar_akhir: id_status_bayar_akhir,
        );

  factory RekamMedis.fromJson(Map<String, dynamic> json) {
    return RekamMedis(
      id_rekammedis: json['id_rekammedis'],
      pasien: PasienRM.fromJson(json['pasien']),
      dokter: DokterRM.fromJson(json['dokter']),
      id_invoice: json['id_invoice'],
      bb_pasien: json['bb_pasien'],
      tekanan_darah: json['tekanan_darah'],
      hasil_diagnosa: json['hasil_diagnosa'],
      resep_obat: json['resep_obat'],
      id_status_bayar_akhir: json['id_status_bayar_akhir'],
    );
  }
}


//membuat kelas RekamMedis yang merupakan StatefulWidget, hasil navigasi dari PilihPasien
class RekamMedisPage extends StatefulWidget {
  //parameter rekammedisbyid
  final int id_rekammedis;

  RekamMedisPage({required this.id_rekammedis});

  // final Patient rekammedisbyid;
  // RekamMedis({required this.rekammedisbyid});

  @override
  _RekamMedis createState() => _RekamMedis();
}

//membuat kelas _RekamMedis yang merupakan State dari RekamMedis
class _RekamMedis extends State<RekamMedisPage> {
  //gunakan rekammedisbyid untuk menampilkan informasi pasien
  late Future<RekamMedis> rekamByid;
  // final Patient rekammedisbyid;
  // _RekamMedis({required this.rekammedisbyid});

  @override
  void initState() {
    super.initState();
    print('Id Rekam Medis: ${widget.id_rekammedis}');
    rekamByid = _fetchRekamMedis();
  }

  Future<RekamMedis> _fetchRekamMedis() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/rekam_medis/${widget.id_rekammedis}'),
    );

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return RekamMedis.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load rekam medis: ${response.statusCode}');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'REKAM MEDIS',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          //menggunakan icon arrow back
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
        toolbarHeight: 87,
      ),
      body: FutureBuilder<RekamMedis>(
        future: rekamByid,
        
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            RekamMedis rekammedisbyid = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 0,
                  ),

                  //informasi pasien
                  SizedBox(height: 10),
                  Container(
                    width: 345,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFCEE7FD),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 345,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF0068D7),
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              'Informasi Pasien',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nama Pasien   : ${rekammedisbyid.pasien.nama_pasien}',
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'Tanggal Lahir  : ${rekammedisbyid.pasien.tl_pasien}',
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //hasil rekam medis
                  SizedBox(height: 20),
                  Container(
                    width: 345,
                    height: 365,
                    padding: EdgeInsets.only(
                        top: 12, bottom: 12, left: 16, right: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFFCEE7FD),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //baris untuk spesialis dan dokter
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Spesialis  : ${rekammedisbyid.dokter.spesialis.nama_spesialis}',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Dokter       : ${rekammedisbyid.dokter.nama_dokter}',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        //baris untuk berat badan dan tekanan darah
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Berat Badan',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${rekammedisbyid.bb_pasien}',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //di expand tekanan darahnya
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tekanan Darah',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${rekammedisbyid.tekanan_darah}',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        //hasil diagnosa
                        TextButton(
                          onPressed: () {
                            // Aksi ketika diagnosa diklik  mengarah ke file pdf
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => PDFPage(
                            //         rekammedisbyid.pd,
                            //         'HASIL DIAGNOSA'),
                            //   ),
                            // );
                          },
                          child: Text(
                            'Hasil Diagnosa',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        //resep obat
                        TextButton(
                          onPressed: () {
                            // Aksi ketika resep obat diklik mengarah ke file pdf
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => PDFPage(
                            //         rekammedisbyid.resepPdfPath, 'RESEP OBAT'),
                            //   ),
                            // );
                          },
                          child: Text(
                            'Resep Obat',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                        //baris untuk status pembayaran dan nominal
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //memakai container
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                color: Color(0xFF389AFF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Status Pembayaran',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        //tombol untuk pembayaran
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            //Aksi ke halaman pembayaran
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PilihPembayaran()), //mengarahkan kembali ke halaman janji temu
                            );
                          },
                          child: Text(
                            'BAYAR',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0068D7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal:
                                  130, // Atur padding horizontal sesuai kebutuhan
                            ),
                            // Tambahkan minWidth untuk menentukan lebar minimum tombol
                            minimumSize: Size(40, 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox(); // return an empty container if no data is available
          }
        },
      ),
    );
  }
}

class PDFPage extends StatelessWidget {
  final String pdfAssetPath;
  final String title;

  PDFPage(this.pdfAssetPath, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        centerTitle: true,
        title: Text(
          title,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        iconTheme: IconThemeData(
            color: Colors.white), // Mengatur warna ikon "back" menjadi putih
        toolbarHeight: 87, //tinggi app bar
      ),
      body: SfPdfViewer.asset(pdfAssetPath),
    );
  }
}
