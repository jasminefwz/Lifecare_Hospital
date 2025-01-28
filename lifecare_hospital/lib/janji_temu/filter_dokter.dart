import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// Kelas untuk menampilkan filter data
class FilterData {
  final List<String> spesialisasi; // List untuk menyimpan spesialisasi dokter
  final List<String> hari; // List untuk menyimpan hari praktek dokter
  final List<String> waktu; // List untuk menyimpan waktu praktek dokter

  FilterData({
    required this.spesialisasi,
    required this.hari,
    required this.waktu,
  });

  int totalFilters() {
    return spesialisasi.length +
        hari.length +
        waktu.length; // Menghitung total filter yang dipilih
  }
}

class FilterOption extends StatefulWidget {
  final String title; // Judul filter
  final List<String> options; // Opsi filter
  final List<String> selectedOptions; // Opsi yang dipilih
  final ValueChanged<List<String>>
      onChanged; // Metode yang dipanggil ketika opsi berubah

  const FilterOption({
    required this.title,
    required this.options,
    required this.selectedOptions,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _FilterOptionState createState() => _FilterOptionState();
}

// Kelas untuk menampilkan halaman filter dokter
class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'FILTER',
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
            'images/arrowLeft.png',
            width: 15,
            height: 15,
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Aksi ketika tombol panah kembali ditekan
          },
        ),
        toolbarHeight: 87,
      ),
      body: FilterForm(), // Menampilkan form filter
    );
  }
}

class _FilterOptionState extends State<FilterOption> {
  List<String> _selectedOptions = [];

  void _showCheckBoxDialog(
      BuildContext context, String title, List<String> options) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih ' + title), // Judul dialog
          backgroundColor: Color(0xFFCEE7FD), // Warna latar belakang dialog
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: options.map((String option) {
                return CheckboxListTile(
                  title: Text(option), // Menampilkan opsi
                  value: _selectedOptions
                      .contains(option), // Menentukan status opsi
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null) {
                        if (value) {
                          _selectedOptions
                              .add(option); // Menambah opsi yang dipilih
                        } else {
                          _selectedOptions
                              .remove(option); // Menghapus opsi yang dipilih
                        }
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0068D7), // Warna tombol
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Tutup',
                style: TextStyle(
                  color: Colors.white,
                ),
              ), // Tombol untuk menutup dialog
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          widget.title, // Menampilkan judul filter
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        if (widget.title == 'SPESIALISASI') // Jika filter adalah spesialisasi
          Container(
            width: 400,
            child: DropdownButtonFormField<String>(
              value: _selectedOptions.isNotEmpty ? _selectedOptions[0] : null,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOptions.clear();
                  if (newValue != null) {
                    _selectedOptions.add(newValue);
                  }
                });
              },
              items: [
                DropdownMenuItem<String>(
                  value: 'Semua Spesialisasi', // Opsi semua spesialisasi
                  child: Text(
                    'Semua Spesialisasi',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ...widget.options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option, // Opsi spesialisasi lainnya
                    child: Text(option),
                  );
                }).toList(),
              ],
              icon: Icon(Icons.arrow_drop_down, color: Colors.black),
              iconEnabledColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFCEE7FD), // Warna latar belakang
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none, // Menghapus border
                ),
              ),
            ),
          ),
        if (widget.title != 'SPESIALISASI') // Jika filter bukan spesialisasi
          InkWell(
            onTap: () {
              _showCheckBoxDialog(context, widget.title,
                  widget.options); // Menampilkan dialog untuk memilih opsi
            },
            child: Container(
              width: 400,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFCEE7FD),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_selectedOptions.isNotEmpty
                      ? _selectedOptions.join(
                          ", ") // Menampilkan opsi yang dipilih sebagai teks
                      : 'Pilih ' +
                          widget
                              .title), // Menampilkan teks default jika tidak ada yang dipilih
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class FilterForm extends StatefulWidget {
  @override
  _FilterFormState createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  List<String> _selectedSpesialisasi = [];
  List<String> _selectedHari = [];
  List<String> _selectedWaktu = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Filter Dokter berdasarkan Beberapa Opsi',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Column(
            children: [
              FilterOption(
                title: 'SPESIALISASI',
                options: [
                  'Dokter Umum',
                  'Jantung',
                  'Dokter Gigi',
                  'OBGYN'
                ], // Opsi spesialisasi
                selectedOptions: _selectedSpesialisasi,
                onChanged: (selectedOptions) {
                  setState(() {
                    _selectedSpesialisasi = selectedOptions;
                  });
                },
              ),
              SizedBox(height: 20),
              FilterOption(
                title: 'HARI',
                options: [
                  'Senin',
                  'Selasa',
                  'Rabu',
                  'Kamis',
                  'Jumat',
                  'Sabtu'
                ], // Opsi hari
                selectedOptions: _selectedHari,
                onChanged: (selectedOptions) {
                  setState(() {
                    _selectedHari = selectedOptions;
                  });
                },
              ),
              SizedBox(height: 20),
              FilterOption(
                title: 'WAKTU',
                options: ['Pagi', 'Siang', 'Malam'], // Opsi waktu
                selectedOptions: _selectedWaktu,
                onChanged: (selectedOptions) {
                  setState(() {
                    _selectedWaktu = selectedOptions;
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedSpesialisasi.clear();
                  _selectedHari.clear();
                  _selectedWaktu.clear();
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                'RESET', // Tombol untuk mereset pilihan filter
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                FilterData filterData = FilterData(
                  spesialisasi: _selectedSpesialisasi,
                  hari: _selectedHari,
                  waktu: _selectedWaktu,
                );
                Navigator.of(context).pop(
                    filterData); // Menutup halaman filter dan mengirimkan data filter
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF0068D7)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                'CARI', // Tombol untuk memulai pencarian berdasarkan filter
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

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