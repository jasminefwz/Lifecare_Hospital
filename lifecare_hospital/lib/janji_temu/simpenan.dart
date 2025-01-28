import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../janji_temu/pesan_sendiri.dart';
import '../janji_temu/pesan_orang_lain.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Spesialis {
  final String namaSpesialis;

  Spesialis({required this.namaSpesialis});

  factory Spesialis.fromJson(Map<String, dynamic> json) {
    return Spesialis(
      namaSpesialis: json['nama_spesialis'],
    );
  }
}

class Hari {
  final String namaHari;

  Hari({required this.namaHari});

  factory Hari.fromJson(Map<String, dynamic> json) {
    return Hari(
      namaHari: json['nama_hari'],
    );
  }
}

class Waktu {
  final String namaWaktu;

  Waktu({required this.namaWaktu});

  factory Waktu.fromJson(Map<String, dynamic> json) {
    return Waktu(
      namaWaktu: json['nama_waktu'],
    );
  }
}

class HariWaktu {
  final Hari hari;
  final Waktu waktu;

  HariWaktu({required this.hari, required this.waktu});

  factory HariWaktu.fromJson(Map<String, dynamic> json) {
    return HariWaktu(
      hari: Hari.fromJson(json['hari']),
      waktu: Waktu.fromJson(json['waktu']),
    );
  }
}

class DokterDetail {
  final int idDokter;
  final String namaDokter;
  final Spesialis spesialis;
  final List<HariWaktu> jadwal;
  final String deskripsiDokter;
  final String photoUrl; // Add the photoUrl property

  DokterDetail({
    required this.idDokter,
    required this.namaDokter,
    required this.spesialis,
    required this.jadwal,
    required this.deskripsiDokter,
    required this.photoUrl, 
  });

  factory DokterDetail.fromJson(Map<String, dynamic> json) {
    return DokterDetail(
      idDokter: json['id_dokter'],
      namaDokter: json['nama_dokter'],
      spesialis: Spesialis.fromJson(json['spesialis']),
      jadwal: (json['jadwal'] as List<dynamic>)
          .map((e) => HariWaktu.fromJson(e))
          .toList(),
      deskripsiDokter: json['deskripsi_dokter'],
      photoUrl:
          json['foto_dokter'],
    );
  }
}

class DokterHariWaktu {
  final int idDokterHariWaktu;
  final int idDokter;
  final int idHariD;
  final int idWaktuD;
  final DokterDetail dokter;
  final Hari hari;
  final Waktu waktu;

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
      dokter: DokterDetail.fromJson(json['dokter']),
      hari: Hari.fromJson(json['hari']),
      waktu: Waktu.fromJson(json['waktu']),
    );
  }
}

// Kelas untuk halaman pilih jadwal
class PilihJadwalPage extends StatefulWidget {
  @override
  _PilihJadwalPageState createState() => _PilihJadwalPageState();
}

// State dari halaman pilih jadwal
class _PilihJadwalPageState extends State<PilihJadwalPage> {
  DateTime? _selectedDateApp;
  TimeOfDay? _selectedTime;

  // Fungsi untuk memilih waktu
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'PILIH JADWAL',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true, // Untuk menempatkan judul di tengah app bar
        leading: IconButton(
          icon: Image.asset(
            'assets/images/arrowLeft.png',
            width: 15,
            height: 15,
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Aksi yang ingin dilakukan saat tombol panah kembali ditekan
          },
        ),
        toolbarHeight: 87,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Tampilkan kalender
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFCEE7FD),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Theme(
              data: ThemeData(
                colorScheme: ColorScheme.light(
                  primary:
                      Color(0xFF0068D7), // Warna untuk tanggal yang dipilih
                ),
              ),
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateChanged: (DateTime selectedDate) {
                  setState(() {
                    _selectedDateApp = selectedDate;
                  });
                },
              ),
            ),
          ),

          // Tombol untuk memilih waktu
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFCEE7FD),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child: Container(
                width: 100,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'Pilih Waktu',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors
                          .blue; // Warna latar belakang saat tombol ditekan
                    }
                    return Color(0xFFCEE7FD); // Warna latar belakang default
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.blue), // Warna teks tombol
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets
                      .zero, // Padding nol agar tidak ada padding tambahan
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFCEE7FD),
              borderRadius: BorderRadius.circular(15),
            ),
            child: _selectedDateApp != null && _selectedTime != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 8.0),
                      Text(
                        'Tanggal: ${_selectedDateApp!.day}/${_selectedDateApp!.month}/${_selectedDateApp!.year}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      SizedBox(
                          height:
                              8.0), // Jarak vertikal antara tanggal dan waktu
                      Text(
                        'Waktu: ${_selectedTime!.hour}:${_selectedTime!.minute}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  )
                : SizedBox(), // Widget kosong jika tanggal dan waktu belum dipilih
          ),

          Expanded(
            child: SizedBox(), // Spacer untuk mendorong tombol ke bawah
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_selectedDateApp != null && _selectedTime != null) {
                    // Jika tanggal dan waktu sudah dipilih, lanjutkan ke halaman berikutnya
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataProfile()),
                    );
                  } else {
                    // Jika tanggal atau waktu belum dipilih, tampilkan pesan kesalahan
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color(0xFFCEE7FD),
                          title: Text(
                            'Error',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                              'Mohon pilih tanggal dan waktu terlebih dahulu.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Color(
                                    0xFF0068D7), // Ganti warna tombol "Ya, Yakin"
                              ),
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    color: Colors.white // Ubah warna teks
                                    ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'PESAN UNTUK DIRI SENDIRI', // Teks tombol pesan untuk diri sendiri
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0068D7), // Warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 60,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Jarak vertikal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_selectedDateApp != null && _selectedTime != null) {
                    // Jika tanggal dan waktu sudah dipilih, lanjutkan ke halaman berikutnya
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PilihOrangLain()),
                    );
                  } else {
                    // Jika tanggal atau waktu belum dipilih, tampilkan pesan kesalahan
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color(0xFFCEE7FD),
                          title: Text(
                            'Error',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                              'Mohon pilih tanggal dan waktu terlebih dahulu.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Color(
                                    0xFF0068D7), // Ganti warna tombol "Ya, Yakin"
                              ),
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    color: Colors.white // Ubah warna teks
                                    ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'PESAN UNTUK ORANG LAIN', // Teks tombol pesan untuk orang lain
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0068D7), // Warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 60,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Jarak vertikal
        ],
      ),
    );
  }
}