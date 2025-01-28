import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../beranda/beranda.dart';
import '../riwayat_pendaftaran/RiwayatDaftar.dart';
import '../janji_temu/filter_dokter.dart';
// import '../janji_temu/model_dokter.dart';
import '../janji_temu/detail_dokter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dokter {
  final int? idDokter;
  final String nama;
  final String spesialis;
  final List<String> hari;
  final String photoUrl; // Add the photoUrl property

  Dokter({
    required this.idDokter,
    required this.nama,
    required this.spesialis,
    required this.hari,
    required this.photoUrl, // Initialize the photoUrl property
  });

  factory Dokter.fromJson(Map<String, dynamic> json) {
    return Dokter(
      idDokter: json['id_dokter'],
      nama: json['nama_dokter'],
      spesialis: json['spesialis'],
      hari: List<String>.from(json['hari']),
      photoUrl:
          json['foto_dokter'], // Provide the correct key for the photo URL
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

class JanjiTemu extends StatefulWidget {
  @override
  _JanjiTemuState createState() => _JanjiTemuState();
}

class _JanjiTemuState extends State<JanjiTemu> {
  FilterData? _filterData;
  List<Dokter> dokterData = [];
  List<Dokter> filteredDokterData = [];

  @override
  void initState() {
    super.initState();
    fetchDokterData();
  }

  Future<void> fetchDokterData() async {
    try {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/dokters/alldokter'),
        headers: {'accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final responseData = ResponseBase.fromJson(data);

        setState(() {
          dokterData = responseData.data;
          filteredDokterData = List.from(dokterData);
        });
      } else {
        throw Exception('Failed to load dokter data');
      }
    } catch (e) {
      print('Error fetching data: $e'); // Debug log
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'BUAT JANJI TEMU',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true, // Judul ditengah app bar
        leading: IconButton(
          icon: Image.asset(
            'images/cancel.png',
            width: 15,
            height: 15,
          ),
          onPressed: () {
            // Aksi saat tombol ditekan
            // Mengganti halaman saat ini dengan BerandaPage dan menghapus semua halaman di atasnya dalam tumpukan navigasi
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BerandaPage()), // Mengarahkan ke BerandaPage
              (route) => false, // Menghapus semua halaman di atasnya
            );
          },
        ),
        toolbarHeight: 87,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Cari Dokter dan Buat Janji Temu',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              onChanged: (value) {
                // Saat nilai TextField berubah, lakukan penyaringan data
                setState(() {
                  filteredDokterData = dokterData.where((dokter) {
                    return dokter.nama
                        .toLowerCase()
                        .contains(value.toLowerCase());
                  }).toList();
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari nama dokter',
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFCEE7FD),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16), // Sesuaikan dengan kebutuhan Anda
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/search.png',
                    width: 8,
                    height: 8,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FilterPage()),
                  );
                  if (result != null) {
                    setState(() {
                      _filterData = result;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xFFCEE7FD), // Ganti warna tombol menjadi biru muda
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/filter.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              if (_filterData != null) ...[
                SizedBox(height: 5),
                Text(
                  '[${_filterData!.totalFilters()}]', // Tampilkan total filter yang dipilih
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDokterData.length,
              itemBuilder: (context, index) {
                final dokter = filteredDokterData[index];
                return Card(
                  color: Color(0xFFCEE7FD),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(dokter.photoUrl),
                        ),
                        title: Text(
                          dokter.nama,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              dokter.spesialis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Divider(),
                            Text(
                              'Ketersediaan hari: ${dokter.hari.join(', ')}',
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         DoctorProfilePage(doctorId: dokter.idDokter), //mengambil id
                          //   ),
                          // );
                          if (dokter.idDokter != null) {
                            // Cetak ID dokter di terminal
                            print('ID Dokter: ${dokter.idDokter}');

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorProfilePage(
                                    doctorId: dokter.idDokter!), //mengambil id
                              ),
                            );
                          } else {
                            // Menampilkan pesan kesalahan atau melakukan tindakan lain
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('ID Dokter tidak tersedia')),
                            );
                          }
                          // if (dokter.idDokter != null) {
                          //   // Cetak ID dokter di terminal
                          //   print('ID Dokter: ${dokter.idDokter}');

                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => DoctorProfilePage(
                          //           doctorId: dokter.idDokter), //mengambil id
                          //     ),
                          //   );
                          // } else {
                          //   // Menampilkan pesan kesalahan atau melakukan tindakan lain
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //         content: Text('ID Dokter tidak tersedia')),
                          //   );
                          // }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF0068D7),
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                          ),
                        ),
                        child: Text(
                          'Buat Janji',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RiwayatDaftar()), //mengarahkan kembali ke halaman janji temu
                  );
                },
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
                child: Text(
                  'RIWAYAT PENDAFTARAN',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
