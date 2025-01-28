import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // Impor package `widgets` untuk mengakses class `StatefulWidget`
import 'package:google_fonts/google_fonts.dart'; // Impor package `google_fonts` untuk mengakses font dari Google Fonts
import '../profil/profile_page.dart';

// Kelas `ProfileEditPage` adalah StatefulWidget untuk halaman edit profil
class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() =>
      _ProfileEditPageState(); // Membuat state dari halaman edit profil
}

List<String> options = ['Perempuan', 'Laki-laki']; // List pilihan jenis kelamin

// Kelas `_ProfileEditPageState` adalah state dari halaman edit profil
class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController _dateController =
      TextEditingController(); // Controller untuk inputan tanggal lahir

  String currentOption =
      options[0]; // Pilihan jenis kelamin saat ini (default 'PEREMPUAN')

  @override
  Widget build(BuildContext context) {
    // Method untuk membangun tampilan halaman edit profil
    return Scaffold(
      // Scaffold sebagai kerangka halaman
      appBar: AppBar(
        // AppBar sebagai bagian atas halaman
        backgroundColor: Color(0xFF0068D7), // Warna latar belakang AppBar
        title: Text(
          // Judul AppBar
          'EDIT PROFIL', // Teks judul
          style: GoogleFonts.nunito(
            // Gaya teks menggunakan Google Fonts
            textStyle: TextStyle(
              fontWeight: FontWeight.bold, // Ketebalan teks
              fontSize: 20, // Ukuran teks
              color: Colors.white, // Warna teks
            ),
          ),
        ),
        centerTitle: true, // Untuk menempatkan judul di tengah app bar
        leading: IconButton(
          // Tombol kembali di sebelah kiri AppBar
          icon: const Icon(
            Icons.arrow_back, // Icon panah ke kiri
            color: Colors.white, // Warna icon
          ),
          onPressed: () {
            // Aksi yang ingin dilakukan saat tombol panah kembali ditekan
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        toolbarHeight: 87, // Tinggi AppBar
      ),
      body: SingleChildScrollView(
        // SingleChildScrollView agar tampilan dapat digulir
        child: Padding(
          // Padding untuk memberikan jarak antara elemen-elemen dalam tampilan
          padding: const EdgeInsets.all(5.0), // Padding sebesar 5.0
          child: Column(
            // Widget kolom untuk menyusun elemen secara vertikal
            crossAxisAlignment: CrossAxisAlignment
                .start, // Susunan elemen mulai dari kiri ke kanan
            children: [
              // Elemen-elemen dalam halaman edit profil
              Text(
                // Teks untuk judul halaman
                'EDIT PROFILE', // Teks judul
                style: GoogleFonts.nunito(
                    // Gaya teks menggunakan Google Fonts
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, // Ketebalan teks
                  wordSpacing: 2, // Spasi antar kata
                  fontSize: 25, // Ukuran teks
                )),
              ),
              Row(
                // Baris untuk menampilkan foto profil dan informasi pengguna
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Susunan elemen mulai dari tengah
                children: [
                  const Padding(
                    // Padding untuk foto profil
                    padding: EdgeInsets.only(
                        left: 30), // Padding sebelah kiri sebesar 30
                    child: CircleAvatar(
                      // Widget untuk menampilkan foto profil dalam bentuk lingkaran
                      backgroundColor:
                          Colors.amber, // Warna latar belakang foto profil
                      radius: 70, // Radius foto profil
                      backgroundImage: AssetImage(
                          'assets/images/201634.Png'), // Gambar foto profil
                    ),
                  ),
                  Column(
                    // Widget kolom untuk menyusun elemen secara vertikal
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Susunan elemen mulai dari kiri ke kanan
                    children: [
                      // Elemen-elemen dalam kolom
                      Padding(
                        // Padding untuk teks nama akun
                        padding: const EdgeInsets.only(
                            left: 10), // Padding sebelah kiri sebesar 10
                        child: Text(
                          // Teks untuk nama akun
                          'Nama Akun', // Judul
                          style: GoogleFonts.nunito(
                              // Gaya teks menggunakan Google Fonts
                              textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, // Ketebalan teks
                            wordSpacing: 2, // Spasi antar kata
                            fontSize: 35, // Ukuran teks
                          )),
                        ),
                      ),
                      
                      Padding(
                        // Padding untuk nomor pasien
                        padding: const EdgeInsets.only(
                            left: 10), // Padding sebelah kiri sebesar 10
                        child: Text(
                          // Teks untuk nomor pasien
                          "No. Pasien : 012345", // Nomor pasien
                          style: GoogleFonts.nunito(
                              // Gaya teks menggunakan Google Fonts
                              textStyle: const TextStyle(
                            wordSpacing: 2, // Spasi antar kata
                            fontSize: 15, // Ukuran teks
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                // Spasi vertikal
                height: 15,
              ),
              Padding(
                // Padding untuk elemen-elemen berikutnya
                padding: const EdgeInsets.only(
                    left: 20), // Padding sebelah kiri sebesar 20
                child: Column(
                  // Widget kolom untuk menyusun elemen secara vertikal
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Susunan elemen mulai dari kiri ke kanan
                  children: [
                    // Elemen-elemen dalam kolom
                    Text(
                      // Teks untuk judul nama lengkap
                      'Nama Lengkap', // Judul
                      style: GoogleFonts.nunito(
                          // Gaya teks menggunakan Google Fonts
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, // Ketebalan teks
                        wordSpacing: 2, // Spasi antar kata
                        fontSize: 20, // Ukuran teks
                      )),
                    ),
                    TextFormField(
                      // Input untuk nama lengkap pengguna
                      initialValue: "Ratu Syahirah K.", // Nilai awal input
                      style: GoogleFonts.nunito(
                        // Gaya teks menggunakan Google Fonts
                        textStyle: const TextStyle(
                          wordSpacing: 2, // Spasi antar kata
                          fontSize: 15, // Ukuran teks
                        ),
                      ),
                      decoration: const InputDecoration(
                        // Dekorasi input
                        border: UnderlineInputBorder(
                          // Garis bawah untuk input
                          borderSide: BorderSide(
                              color: Colors.black), // Warna garis bawah
                        ),
                      ),
                    ),
                    const SizedBox(
                      // Spasi vertikal
                      height: 5,
                    ),
                    Text(
                      // Teks untuk judul NIK
                      'NIK', // Judul
                      style: GoogleFonts.nunito(
                          // Gaya teks menggunakan Google Fonts
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, // Ketebalan teks
                        wordSpacing: 2, // Spasi antar kata
                        fontSize: 20, // Ukuran teks
                      )),
                    ),
                    TextFormField(
                      // Input untuk NIK pengguna
                      initialValue: "0384924028572992", // Nilai awal input
                      style: GoogleFonts.nunito(
                        // Gaya teks menggunakan Google Fonts
                        textStyle: const TextStyle(
                          wordSpacing: 2, // Spasi antar kata
                          fontSize: 15, // Ukuran teks
                        ),
                      ),
                      decoration: InputDecoration(
                        // Dekorasi input
                        border: UnderlineInputBorder(
                          // Garis bawah untuk input
                          borderSide: BorderSide(
                              color: Colors.black), // Warna garis bawah
                        ),
                      ),
                    ),
                    const SizedBox(
                      // Spasi vertikal
                      height: 5,
                    ),
                    // Lanjutan elemen-elemen seperti tempat lahir, tanggal lahir, jenis kelamin, alamat, nomor telepon, dan email
                    Text(
                      'Tempat Lahir',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        fontSize: 20,
                      )),
                    ),
                    TextFormField(
                      initialValue: "Bandung",
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          wordSpacing: 2,
                          fontSize: 15,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Tanggal Lahir',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        fontSize: 20,
                      )),
                    ),
                    TextFormField(
                      controller: _dateController,
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          wordSpacing: 2,
                          fontSize: 15,
                        ),
                      ),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDate();
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Jenis Kelamin',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        fontSize: 20,
                      )),
                    ),
                    Column(
                      children: [
                        ListTile(
                          title: Text('Perempuan'),
                          leading: Radio(
                            value: options[0],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text('Laki-laki'),
                          leading: Radio(
                            value: options[1],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Alamat',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        fontSize: 20,
                      )),
                    ),
                    TextFormField(
                      initialValue: "Jalan Mawar",
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          wordSpacing: 2,
                          fontSize: 15,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Nomor Telepon',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        fontSize: 20,
                      )),
                    ),
                    TextFormField(
                      initialValue: "0938538492942",
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          wordSpacing: 2,
                          fontSize: 15,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Email',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        fontSize: 20,
                      )),
                    ),
                    TextFormField(
                      initialValue: "ratuSyah@gmail.com",
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          wordSpacing: 2,
                          fontSize: 15,
                        ),
                      ),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                // Spasi vertikal
                height: 49,
              ),
              Row(
                // Baris untuk tombol "SIMPAN PERUBAHAN"
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // Susunan elemen mulai dari tepi
                children: [
                  ElevatedButton(
                    // Tombol "SIMPAN PERUBAHAN"
                    onPressed: () {
                      // Aksi saat tombol "SIMPAN PERUBAHAN" ditekan
                      showDialog(
                        // Tampilkan dialog konfirmasi
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            // Dialog untuk konfirmasi simpan perubahan
                            shape: RoundedRectangleBorder(
                              // Bentuk dialog
                              borderRadius:
                                  BorderRadius.circular(10), // Sudut dialog
                            ),
                            child: Container(
                              // Container dalam dialog
                              width: 340, // Lebar container
                              height: 96, // Tinggi container
                              decoration: BoxDecoration(
                                // Dekorasi container dalam dialog
                                color: Color(
                                    0xFFCEE7FD), // Warna latar belakang container
                                borderRadius: BorderRadius.circular(
                                    10), // Sudut container
                              ),
                              child: Column(
                                // Widget kolom untuk menyusun elemen secara vertikal dalam container
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Susunan elemen mulai dari tengah
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, // Susunan elemen mulai dari tengah
                                children: [
                                  // Elemen-elemen dalam kolom
                                  Text(
                                    // Teks konfirmasi
                                    'Yakin SIMPAN PERUBAHAN ?', // Teks konfirmasi
                                    textAlign: TextAlign
                                        .center, // Penyusunan teks tengah
                                    style: TextStyle(
                                      // Gaya teks
                                      fontFamily: 'Poppins', // Font teks
                                      fontWeight:
                                          FontWeight.w600, // Ketebalan teks
                                    ),
                                  ),
                                  SizedBox(height: 20), // Spasi vertikal
                                  Row(
                                    // Baris untuk tombol "Ya, Simpan Perubahan" dan "Kembali"
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, // Susunan elemen mulai dari tengah
                                    children: [
                                      ElevatedButton(
                                        // Tombol "Kembali"
                                        onPressed: () {
                                          // Aksi saat tombol "Kembali" ditekan
                                          Navigator.of(context)
                                              .pop(); // Tutup dialog
                                        },
                                        child: Text(
                                          // Teks tombol "Kembali"
                                          'Kembali', // Teks
                                          textAlign: TextAlign
                                              .center, // Penyusunan teks tengah
                                          style: TextStyle(
                                            // Gaya teks
                                            color: Colors.white, // Warna teks
                                            fontFamily: 'Poppins', // Font teks
                                            fontWeight: FontWeight
                                                .w600, // Ketebalan teks
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          // Gaya tombol
                                          backgroundColor: Color(
                                              0xFF0068D7), // Warna latar belakang tombol
                                          padding: EdgeInsets.symmetric(
                                              // Padding tombol
                                              horizontal: 20),
                                        ),
                                      ),
                                      SizedBox(width: 20), // Spasi horizontal
                                      ElevatedButton(
                                        // Tombol "Ya, Simpan Perubahan"
                                        onPressed: () {
                                          // Aksi saat tombol "Ya, Simpan Perubahan" ditekan
                                          Navigator.push(
                                            // Navigasi kembali ke halaman profil
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePage()),
                                          );
                                        },
                                        child: Text(
                                          // Teks tombol "Ya, Simpan Perubahan"
                                          'Ya, Simpan Perubahan', // Teks
                                          textAlign: TextAlign
                                              .center, // Penyusunan teks tengah
                                          style: TextStyle(
                                            // Gaya teks
                                            color: Colors.white, // Warna teks
                                            fontFamily: 'Poppins', // Font teks
                                            fontWeight: FontWeight
                                                .w600, // Ketebalan teks
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          // Gaya tombol
                                          backgroundColor: Color(
                                              0xFF0068D7), // Warna latar belakang tombol
                                          padding: EdgeInsets.symmetric(
                                              // Padding tombol
                                              horizontal: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      // Gaya tombol "SIMPAN PERUBAHAN"
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFF0068D7)), // Warna latar belakang tombol
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        // Padding tombol
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        // Bentuk tombol
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Sudut tombol
                        ),
                      ),
                    ),
                    child: const Text(
                      // Teks tombol "SIMPAN PERUBAHAN"
                      'SIMPAN PERUBAHAN', // Teks
                      style: TextStyle(
                          color:
                              Color.fromARGB(255, 255, 255, 255)), // Gaya teks
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    // Method untuk memilih tanggal lahir
    DateTime? picked = await showDatePicker(
        // Tampilkan dialog pemilihan tanggal
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (picked != null) {
      // Jika tanggal dipilih
      setState(() {
        // Ubah state
        _dateController.text = picked
            .toString()
            .split(" ")[0]; // Set nilai controller dengan tanggal yang dipilih
      });
    }
  }
}
