import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../riwayat_pendaftaran/RiwayatDaftar.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Kelas untuk halaman menampilkan data diri user
class DataProfile extends StatefulWidget {
  @override
  _DataProfileState createState() => _DataProfileState();
}

class PatientProfile {
  final String name;
  final String nik;
  final String tmptlahir;
  final String dob;
  final String gender;
  final String alamat;
  final String notelp;

  //konstruktor untuk inisialisasi data pasien
  PatientProfile({
    required this.name,
    required this.nik,
    required this.tmptlahir,
    required this.dob,
    required this.gender,
    required this.alamat,
    required this.notelp,
  });
}

class _DataProfileState extends State<DataProfile> {
  List<PatientProfile> patients = [
    PatientProfile(
      name: 'Ratu Syahirah K.',
      nik: '0384924028572992',
      tmptlahir: 'Bandung',
      dob: '12 Desember 2012',
      gender: 'Perempuan',
      alamat: 'Jalan Mawar',
      notelp: '08123567899',
    )
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'DATA DIRI',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nama Lengkap',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${patients[index].name}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'NIK',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${patients[index].nik}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tempat Lahir',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${patients[index].tmptlahir}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tanggal Lahir',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${patients[index].dob}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Jenis Kelamin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${patients[index].gender}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Alamat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${patients[index].alamat}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'No Telepon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${patients[index].notelp}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Color(0xFFCEE7FD),
                        title: Text(
                          'Konfirmasi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content:
                            Text('Apakah Anda Yakin akan Membuat Janji Temu?'),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              // Kembali
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Kembali',
                              style: TextStyle(
                                  color: Colors.white // Ubah warna teks
                                  ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                  0xFF0068D7), // Ganti warna tombol "Ya, Yakin"
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Proses pendaftaran
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RiwayatDaftar()), //mengarahkan kembali ke halaman janji temu
                              );
                            },
                            child: Text(
                              'Ya, Yakin',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white // Ubah warna teks
                                  ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                  0xFF0068D7), // Ganti warna tombol "Ya, Yakin"
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'PESAN',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0068D7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}