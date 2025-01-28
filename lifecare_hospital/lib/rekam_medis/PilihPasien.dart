import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../beranda/beranda.dart';
import '../rekam_medis/RekamMedis.dart';

class Patient {
  final int id_pasien;
  final String nama_pasien;
  final String tl_pasien;
  final String jk_pasien;

  Patient({required this.id_pasien, required this.nama_pasien, required this.tl_pasien, required this.jk_pasien});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id_pasien: json['id_pasien'],
      nama_pasien: json['nama_pasien'],
      tl_pasien: json['tl_pasien'],
      jk_pasien: json['jk_pasien'],
    );
  }
}

class PilihPasien extends StatefulWidget {
  @override
  _PilihPasien createState() => _PilihPasien();
}

class _PilihPasien extends State<PilihPasien> {
  List<Patient> patients = [];

  @override
  void initState() {
    super.initState();
    fetchPatients();
  }

  Future<void> fetchPatients() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/rekam_medis/getpasienrm'));

    if (response.statusCode == 200) {
      // return Patient.fromJson(json.decode(response.body));
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        patients = data.map((patient) => Patient.fromJson(patient)).toList();
      });
    } else {
      throw Exception('Failed to load patients');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'PILIH PASIEN',
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
          icon: Icon(Icons.close),
          color: Colors.white,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => BerandaPage()),
              (route) => false,
            );
          },
        ),
        toolbarHeight: 87,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 0,
            ),
            SizedBox(height: 3),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: patients.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RekamMedisPage(id_rekammedis: patients[index].id_pasien)),
                        );
                      },
                      child: Container(
                        width: 350,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFCEE7FD),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 38, left: 12, right: 12),
                              child: Image.asset(
                                'assets/images/profil.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Container(
                              height: 137,
                              width: 1,
                              color: Colors.black,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Nama Pasien    : ${patients[index].nama_pasien}',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          'Tanggal Lahir   : ${patients[index].tl_pasien}',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          'Jenis Kelamin  : ${patients[index].jk_pasien}',
                                          style: GoogleFonts.poppins(
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}



// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http; // import http package
// import '../beranda/beranda.dart';
// import '../rekam_medis/RekamMedis.dart';

// class PilihPasien extends StatefulWidget {
//   @override
//   _PilihPasien createState() => _PilihPasien();
// }

// class _PilihPasien extends State<PilihPasien> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF0068D7),
//         title: Text(
//           'PILIH PASIEN',
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
//           icon: Icon(Icons.close),
//           color: Colors.white,
//           onPressed: () {
//             Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => BerandaPage()),
//               (route) => false,
//             );
//           },
//         ),
//         toolbarHeight: 87,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: double.infinity,
//               height: 0,
//             ),
//             SizedBox(height: 3),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: patients.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Column(
//                   children: [
//                     SizedBox(height: 15),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => RekamMedis(
//                                   selectedPatient: patients[index])),
//                         );
//                       },
//                       child: Container(
//                         width: 350,
//                         height: 130,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Color(0xFFCEE7FD),
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 38, left: 12, right: 12),
//                               child: Image.asset(
//                                 'assets/images/profil.png',
//                                 width: 50,
//                                 height: 50,
//                               ),
//                             ),
//                             Container(
//                               height: 137,
//                               width: 1,
//                               color: Colors.black,
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           'Nama Pasien    : ${patients[index].nama_pasien}',
//                                           style: GoogleFonts.poppins(
//                                             textStyle: TextStyle(
//                                               fontSize: 14,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 8),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           'Tanggal Lahir   : ${patients[index].tl_pasien}',
//                                           style: GoogleFonts.poppins(
//                                             textStyle: TextStyle(
//                                               fontSize: 14,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 8),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           'Jenis Kelamin  : ${patients[index].jk_pasien}',
//                                           style: GoogleFonts.poppins(
//                                             textStyle: TextStyle(
//                                               fontSize: 14,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//             SizedBox(height: 15),
//           ],
//         ),
//       ),
//     );
//   }
// }