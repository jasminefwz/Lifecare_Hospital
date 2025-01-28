import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../janji_temu/appointment.dart';


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

class DoctorProfilePage extends StatefulWidget {
  final int doctorId;

  DoctorProfilePage({required this.doctorId});

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  late Future<DokterDetail> _doctorProfile;

  @override
  void initState() {
    super.initState();
    print('Doctor ID received in DoctorProfilePage: ${widget.doctorId}');
    _doctorProfile = _fetchDoctorProfile();
  }

  Future<DokterDetail> _fetchDoctorProfile() async {
    final response = await http.get(
      Uri.parse(
          'http://127.0.0.1:8000/dokters/detaildokter/${widget.doctorId}'),
    );

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return DokterDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load doctor profile: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'PROFIL DOKTER',
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
          icon: Image.asset(
            'assets/images/arrowLeft.png',
            width: 15,
            height: 15,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        toolbarHeight: 87,
      ),
      body: FutureBuilder<DokterDetail>(
        future: _doctorProfile,
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
            DokterDetail dokter = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 400,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFCEE7FD),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(dokter.photoUrl), // Use NetworkImage for URL
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dokter.namaDokter,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                dokter.spesialis.namaSpesialis,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 400,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFCEE7FD),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deskripsi Dokter',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            dokter.deskripsiDokter,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 400,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFCEE7FD),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/janjiTemu.png',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Jadwal Rawat Jalan',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(),
                          ListView.builder(
                            padding: EdgeInsets.zero, // added padding
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: dokter.jadwal.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(dokter.jadwal[index].hari.namaHari),
                                subtitle: Text(dokter.jadwal[index].waktu.namaWaktu),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => PilihJadwalPage(doctorId: dokter.idDokter)),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PilihJadwalPage()),
                          );
                        },
                        child: Text(
                          'BUAT JANJI TEMU',
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
                  SizedBox(height: 20),
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

// class Spesialis {
//   final int idSpesialis;
//   final String namaSpesialis;

//   Spesialis({required this.idSpesialis, required this.namaSpesialis});

//   factory Spesialis.fromJson(Map<String, dynamic> json) {
//     return Spesialis(
//       idSpesialis: json['id_spesialis'],
//       namaSpesialis: json['nama_spesialis'],
//     );
//   }
// }

// class Hari {
//   final int idHari;
//   final String namaHari;

//   Hari({required this.idHari, required this.namaHari});

//   factory Hari.fromJson(Map<String, dynamic> json) {
//     return Hari(
//       idHari: json['id_hari'],
//       namaHari: json['nama_hari'],
//     );
//   }
// }

// class Waktu {
//   final int idWaktu;
//   final String namaWaktu;

//   Waktu({required this.idWaktu, required this.namaWaktu});

//   factory Waktu.fromJson(Map<String, dynamic> json) {
//     return Waktu(
//       idWaktu: json['id_waktu'],
//       namaWaktu: json['nama_waktu'],
//     );
//   }
// }

// class DokterDetail {
//   final int idDokter;
//   final String namaDokter;
//   final int idSpesialisD;
//   final String deskripsiDokter;
//   final String fotoDokter;
//   final Spesialis spesialis;
//   final List<DokterHariWaktu> jadwalRawatJalan;

//   DokterDetail({
//     required this.idDokter,
//     required this.namaDokter,
//     required this.idSpesialisD,
//     required this.deskripsiDokter,
//     required this.fotoDokter,
//     required this.spesialis,
//     required this.jadwalRawatJalan,
//   });

//   factory DokterDetail.fromJson(Map<String, dynamic> json) {
//     return DokterDetail(
//       idDokter: json['id_dokter'],
//       namaDokter: json['nama_dokter'],
//       idSpesialisD: json['id_spesialis_d'],
//       deskripsiDokter: json['deskripsi_dokter'],
//       fotoDokter: json['foto_dokter'],
//       spesialis: Spesialis.fromJson(json['spesialis']),
//       jadwalRawatJalan: (json['jadwal_rawat_jalan'] as List<dynamic>)
//           .map((e) => DokterHariWaktu.fromJson(e))
//           .toList(),
//     );
//   }
// }



// class DoctorProfilePage extends StatefulWidget {
//   final int doctorId;

//   DoctorProfilePage({required this.doctorId});

//   @override
//   _DoctorProfilePageState createState() => _DoctorProfilePageState();
// }

// class _DoctorProfilePageState extends State<DoctorProfilePage> {
//   late Future<DokterDetail> _doctorProfile;

//   @override
//   void initState() {
//     super.initState();
//     print('Doctor ID received in DoctorProfilePage: ${widget.doctorId}');
//     _doctorProfile = _fetchDoctorProfile();
//   }

//   Future<DokterDetail> _fetchDoctorProfile() async {
//     final response = await http.get(
//       Uri.parse(
//           'http://127.0.0.1:8000/dokters/detaildokter/${widget.doctorId}'),
//     );

//     if (response.statusCode == 200) {
//       return DokterDetail.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load doctor profile: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF0068D7),
//         title: Text(
//           'PROFIL DOKTER',
//           style: GoogleFonts.nunito(
//             textStyle: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Image.asset(
//             'assets/images/arrowLeft.png',
//             width: 15,
//             height: 15,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         toolbarHeight: 87,
//       ),
//       body: FutureBuilder<DokterDetail>(
//         future: _doctorProfile,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else if (snapshot.hasData) {
//             DokterDetail dokter = snapshot.data!;
//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 20),
//                   Center(
//                     child: Container(
//                       width: 400,
//                       padding: EdgeInsets.all(20.0),
//                       decoration: BoxDecoration(
//                         color: Color(0xFFCEE7FD),
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CircleAvatar(
//                             radius: 50,
//                             backgroundImage: NetworkImage(dokter.fotoDokter), // Use NetworkImage for URL
//                           ),
//                           SizedBox(width: 20),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 dokter.namaDokter,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 dokter.spesialis.namaSpesialis,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Center(
//                     child: Container(
//                       width: 400,
//                       padding: EdgeInsets.all(20.0),
//                       decoration: BoxDecoration(
//                         color: Color(0xFFCEE7FD),
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Deskripsi Dokter',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(width: 20),
//                           Text(
//                             dokter.deskripsiDokter,
//                             style: TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Center(
//                     child: Container(
//                       width: 400,
//                       padding: EdgeInsets.all(20.0),
//                       decoration: BoxDecoration(
//                         color: Color(0xFFCEE7FD),
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 'assets/images/janjiTemu.png',
//                                 width: 30,
//                                 height: 30,
//                               ),
//                               SizedBox(width: 20),
//                               Text(
//                                 'Jadwal Rawat Jalan',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Divider(),
//                           ListView.builder(
//                             padding: EdgeInsets.zero, // added padding
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//                             itemCount: dokter.jadwalRawatJalan.length,
//                             itemBuilder: (context, index) {
//                               return ListTile(
//                                 title: Text(dokter
//                                     .jadwalRawatJalan[index].hari.namaHari),
//                                 subtitle: Text(dokter
//                                     .jadwalRawatJalan[index].waktu.namaWaktu),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => PilihJadwalPage()),
//                           );
//                         },
//                         child: Text(
//                           'BUAT JANJI TEMU',
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF0068D7),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                             vertical: 20,
//                             horizontal: 70,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             );
//           } else {
//             return SizedBox(); // return an empty container if no data is available
//           }
//         },
//       ),
//     );
//   }
// }
