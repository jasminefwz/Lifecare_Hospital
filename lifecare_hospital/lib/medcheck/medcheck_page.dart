import 'package:flutter/material.dart'; // Impor paket Flutter
import 'package:google_fonts/google_fonts.dart'; // Impor Google Fonts untuk gaya teks
import '../beranda/beranda.dart';
import '../medcheck/detail_page.dart';
import 'package:http/http.dart' as http; // Impor paket HTTP
import 'dart:convert'; // Impor dart:convert untuk konversi JSON

// Model untuk paket medis sesuai dengan skema
class MedCekSimple {
  final int id_medcek;
  final String paket_medcek;
  final String nama_medcek;
  final String harga_medcek;

  MedCekSimple({
    required this.id_medcek,
    required this.paket_medcek,
    required this.nama_medcek,
    required this.harga_medcek,
  });

  factory MedCekSimple.fromJson(Map<String, dynamic> json) {
    return MedCekSimple(
      id_medcek: json['id_medcek'],
      paket_medcek: json['paket_medcek'],
      nama_medcek: json['nama_medcek'],
      harga_medcek: json['harga_medcek'],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  List<MedCekSimple> _medicalPackages = [];
  List<MedCekSimple> _foundPackages = [];

  @override
  void initState() {
    super.initState();
    _fetchMedicalPackages();
  }

  Future<void> _fetchMedicalPackages() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/medcek/getmedcek'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _medicalPackages =
            data.map((item) => MedCekSimple.fromJson(item)).toList();
        _foundPackages = _medicalPackages;
      });
    } else {
      throw Exception('Failed to load medical packages');
    }
  }

  void _runFilter(String enteredKeyword) {
    List<MedCekSimple> results = [];
    if (enteredKeyword.isEmpty) {
      results = _medicalPackages;
    } else {
      results = _medicalPackages
          .where((package) => package.nama_medcek
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundPackages = results;
    });
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
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Medical Check-Up',
                style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2,
                  fontSize: 25,
                )),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 206, 231, 253),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _textController,
                  onChanged: _runFilter,
                  decoration: const InputDecoration(
                    hintText: 'Cari Layanan Kesehatan',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _foundPackages.isNotEmpty
                  ? GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: _foundPackages.length,
                      itemBuilder: (context, index) {
                        final package = _foundPackages[index];
                        return Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  package.paket_medcek,
                                  style: GoogleFonts.nunito(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23)),
                                ),
                                const Divider(),
                                Text(
                                  package.nama_medcek,
                                  style: GoogleFonts.nunito(
                                      textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                  )),
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        package.harga_medcek,
                                        style: GoogleFonts.nunito(
                                            textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => DetailPage(
                                              medcekId: package
                                                  .id_medcek, // Menambahkan medcekId
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 206, 231, 253),
                                      ),
                                      child: Text(
                                        'Detail',
                                        style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                  : const Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
