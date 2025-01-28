import 'package:flutter/material.dart'; // Import paket Flutter
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts untuk gaya teks
import 'package:http/http.dart' as http; // Impor paket HTTP
import 'dart:convert'; // Impor dart:convert untuk konversi JSON

class MedCek {
  final int id_medcek;
  final String paket_medcek;
  final String nama_medcek;
  final String harga_medcek;
  final String detail_medcek;
  final String prosedur_medcek;

  MedCek({
    required this.id_medcek,
    required this.paket_medcek,
    required this.nama_medcek,
    required this.harga_medcek,
    required this.detail_medcek,
    required this.prosedur_medcek,
  });

  factory MedCek.fromJson(Map<String, dynamic> json) {
    return MedCek(
      id_medcek: json['id_medcek'],
      paket_medcek: json['paket_medcek'],
      nama_medcek: json['nama_medcek'],
      harga_medcek: json['harga_medcek'],
      detail_medcek: json['detail_medcek'],
      prosedur_medcek: json['prosedur_medcek'],
    );
  }
}

class DetailPage extends StatefulWidget {
  final int medcekId; // ID paket medis

  const DetailPage({Key? key, required this.medcekId}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<MedCek> _medcek;

  @override
  void initState() {
    super.initState();
    _medcek = _fetchMedCek();
  }

  Future<MedCek> _fetchMedCek() async {
    final response = await http.get(Uri.parse(
        'http://127.0.0.1:8000/medcek/getmedcekbyid/${widget.medcekId}'));
    if (response.statusCode == 200) {
      return MedCek.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load medcek');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'MEDICAL CHECK-UP',
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
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 87,
      ),
      body: FutureBuilder<MedCek>(
        future: _medcek,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final medcek = snapshot.data!;
            final prosedurItems = medcek.prosedur_medcek.split(
                ','); // Assuming prosedur_medcek is a comma-separated string
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        medcek.paket_medcek,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            wordSpacing: 2,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      Text(
                        medcek.nama_medcek,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            fontSize: 19,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                medcek.harga_medcek,
                                style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                medcek.detail_medcek,
                                style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'JENIS - JENIS PROSEDUR',
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: prosedurItems.length,
                              itemBuilder: (_, index) {
                                final item = prosedurItems[index];
                                return Card(
                                  elevation: 4,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  child: ExpansionTile(
                                    iconColor: Color.fromARGB(255, 0, 0, 0),
                                    collapsedIconColor:
                                        Color.fromARGB(255, 0, 0, 0),
                                    childrenPadding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    expandedCrossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    title: Text(
                                      'Prosedur ${index + 1}',
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                    children: [
                                      Text(
                                        item,
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            const Divider(color: Colors.black),
                            Text(
                              'SYARAT & KETENTUAN',
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Identitas Pasien/Patient identity.',
                                    style: GoogleFonts.nunito(
                                      textStyle: const TextStyle(
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                  const ListTile(
                                    leading: Icon(Icons.circle, size: 10),
                                    title: Text(
                                        'Membawa kartu identitas (KTP/Paspor /Bring identity card (KTP/Passport'),
                                  ),
                                  const ListTile(
                                    leading: Icon(Icons.circle, size: 10),
                                    title: Text(
                                        'Mengisi informed consent yang telah disediakan oleh pihak RS (di lokasi Life Care Hospitals) / Fill up informed consent provided by the hospital'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
