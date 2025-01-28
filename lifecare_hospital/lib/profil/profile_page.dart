import 'package:flutter/material.dart'; // Import paket Flutter
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts untuk gaya teks
import '../profil/profile_edit_page.dart';
import '../profil/ganti_pass.dart';
import '../auth/login_page.dart';
import '../beranda/beranda.dart';

class ProfilePage extends StatefulWidget {
  // Widget stateful untuk halaman profil
  const ProfilePage({Key? key}) : super(key: key); // Konstruktor

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState(); // Membuat state untuk ProfilePage
}

class _ProfilePageState extends State<ProfilePage> {
  // State untuk ProfilePage
  @override
  Widget build(BuildContext context) {
    // Membangun tampilan widget
    return Scaffold(
      // Scaffold sebagai kerangka utama
      appBar: AppBar(
        // App bar di bagian atas
        backgroundColor: Color(0xFF0068D7), // Warna latar belakang app bar
        title: Text(
          // Judul app bar
          'PROFIL', // Teks judul
          style: GoogleFonts.nunito(
            // Gaya teks menggunakan Google Fonts
            textStyle: TextStyle(
              fontWeight: FontWeight.bold, // Ketebalan teks
              fontSize: 20, // Ukuran teks
              color: Colors.white, // Warna teks
            ),
          ),
        ),
        centerTitle: true, // Menempatkan judul di tengah app bar
        leading: IconButton(
          // Tombol di sebelah kiri app bar
          icon: const Icon(
            Icons.arrow_back, // Ikon panah ke belakang
            color: Colors.white, // Warna ikon
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
        actions: [
          // Tindakan di sebelah kanan app bar
          PopupMenuButton(
            // Menu popup untuk tindakan tambahan
            itemBuilder: (BuildContext context) {
              // Membangun item-menu dalam menu popup
              return [
                // Mengembalikan daftar item-menu
                PopupMenuItem(
                  // Item menu dalam menu popup
                  child: ListTile(
                    // Widget daftar di dalam item menu
                    title: Text('Ganti Kata Sandi'), // Judul item menu
                    iconColor: Colors.white, // Warna ikon
                    onTap: () {
                      // Aksi saat opsi "Ganti Password" dipilih
                      Navigator.push(
                        // Navigasi ke halaman GantiPasswordPage
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GantiPasswordPage(), // Halaman GantiPasswordPage
                        ),
                      );
                    },
                  ),
                ),
              ];
            },
          ),
        ],
        toolbarHeight: 87, // Tinggi toolbar
      ),
      body: SingleChildScrollView(
        // Isi halaman, bisa di-scroll
        child: Padding(
          // Padding di sekitar isi halaman
          padding: const EdgeInsets.all(5.0),
          child: Column(
            // Widget kolom untuk menyusun elemen secara vertikal
            crossAxisAlignment: CrossAxisAlignment
                .start, // Susunan elemen mulai dari kiri ke kanan
            children: [
              Text(
                // Teks untuk judul "PROFILE"
                'PROFIL', // Judul
                style: GoogleFonts.nunito(
                  // Gaya teks menggunakan Google Fonts
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold, // Ketebalan teks
                    wordSpacing: 2, // Spasi antar kata
                    fontSize: 25, // Ukuran teks
                  ),
                ),
              ),
              Row(
                // Baris untuk menampilkan informasi profil pengguna
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Susunan elemen mulai dari tengah
                children: [
                  const Padding(
                    // Padding untuk gambar profil
                    padding: EdgeInsets.only(left: 30),
                    child: CircleAvatar(
                      // Gambar profil berbentuk lingkaran
                      backgroundColor:
                          Colors.amber, // Warna latar belakang gambar profil
                      radius: 70, // Radius gambar profil
                      backgroundImage: AssetImage(
                          'assets/images/201634.Png'), // Gambar profil
                    ),
                  ),
                  Column(
                    // Kolom untuk menampilkan detail profil
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Susunan elemen mulai dari kiri ke kanan
                    children: [
                      Padding(
                        // Padding untuk judul nama akun
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          // Teks untuk judul nama akun
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
                        // Padding untuk nama pengguna
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          // Teks untuk nama pengguna
                          "Ratu Syahirah", // Nama pengguna
                          style: GoogleFonts.nunito(
                              // Gaya teks menggunakan Google Fonts
                              textStyle: const TextStyle(
                            wordSpacing: 2, // Spasi antar kata
                            fontSize: 25, // Ukuran teks
                          )),
                        ),
                      ),
                      Padding(
                        // Padding untuk nomor pasien
                        padding: const EdgeInsets.only(left: 10),
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
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  // Widget kolom untuk menyusun elemen secara vertikal
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Susunan elemen mulai dari kiri ke kanan
                  children: [
                    Text(
                      // Teks untuk nama lengkap
                      'Nama Lengkap', // Judul
                      style: GoogleFonts.nunito(
                          // Gaya teks menggunakan Google Fonts
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, // Ketebalan teks
                        wordSpacing: 2, // Spasi antar kata
                        fontSize: 20, // Ukuran teks
                      )),
                    ),
                    Text(
                      // Teks untuk nama lengkap pengguna
                      "Ratu Syahirah K.", // Nama lengkap pengguna
                      style: GoogleFonts.nunito(
                          // Gaya teks menggunakan Google Fonts
                          textStyle: const TextStyle(
                        wordSpacing: 2, // Spasi antar kata
                        fontSize: 15, // Ukuran teks
                      )),
                    ),
                    const SizedBox(
                      // Spasi vertikal
                      height: 5,
                    ),
                    const Divider(
                      // Garis pemisah
                      color: Color.fromARGB(255, 0, 0, 0), // Warna garis
                      height: 5, // Tinggi garis
                      thickness: 1, // Ketebalan garis
                      indent: 1.0, // Indentasi awal garis
                      endIndent: 10, // Indentasi akhir garis
                    ),
                    // Elemen-elemen berikutnya memiliki struktur serupa, seperti nama lengkap
                    Text(
                      'NIK',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        fontSize: 20,
                      )),
                    ),
                    Text(
                      "0384924028572992",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        wordSpacing: 2,
                        fontSize: 15,
                      )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 5,
                      thickness: 1,
                      indent: 1.0,
                      endIndent: 10,
                    ),
                    Text(
                      'Tempat, Tanggal Lahir',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        fontSize: 20,
                      )),
                    ),
                    Text(
                      "Bandung, 12 Desember 2012",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        wordSpacing: 2,
                        fontSize: 15,
                      )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 5,
                      thickness: 1,
                      indent: 1.0,
                      endIndent: 10,
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
                    Text(
                      "Perempuan",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        wordSpacing: 2,
                        fontSize: 15,
                      )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 5,
                      thickness: 1,
                      indent: 1.0,
                      endIndent: 10,
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
                    Text(
                      "Jalan Mawar",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        wordSpacing: 2,
                        fontSize: 15,
                      )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 5,
                      thickness: 1,
                      indent: 1.0,
                      endIndent: 10,
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
                    Text(
                      "081234567899",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        wordSpacing: 2,
                        fontSize: 15,
                      )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 5,
                      thickness: 1,
                      indent: 1.0,
                      endIndent: 10,
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
                    Text(
                      "ratuSyah@Gmail.com",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        wordSpacing: 2,
                        fontSize: 15,
                      )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 5,
                      thickness: 1,
                      indent: 1.0,
                      endIndent: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                // Spasi vertikal
                height: 150,
              ),
              Row(
                // Baris untuk menampilkan tombol Log Out dan Edit
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // Susunan elemen di sepanjang baris dengan jarak yang sama
                children: [
                  ElevatedButton(
                    // Tombol Log Out
                    onPressed: () {
                      // Aksi saat tombol Log Out ditekan
                      showDialog(
                        // Tampilkan dialog konfirmasi
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            // Dialog untuk konfirmasi Log Out
                            shape: RoundedRectangleBorder(
                              // Bentuk dialog
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              // Container dalam dialog
                              width: 300,
                              height: 96,
                              decoration: BoxDecoration(
                                // Dekorasi container dalam dialog
                                color: Color(0xFFCEE7FD),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                // Widget kolom untuk menyusun elemen secara vertikal dalam container
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Susunan elemen mulai dari tengah
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, // Susunan elemen mulai dari tengah
                                children: [
                                  Text(
                                    // Teks konfirmasi Log Out
                                    'Yakin Keluar?', // Teks konfirmasi
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
                                    // Baris untuk tombol Ya dan Kembali
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, // Susunan elemen mulai dari tengah
                                    children: [
                                      ElevatedButton(
                                        // Tombol Kembali
                                        onPressed: () {
                                          // Aksi saat tombol Kembali ditekan
                                          Navigator.of(context)
                                              .pop(); // Tutup dialog
                                        },
                                        child: Text(
                                          // Teks tombol Kembali
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
                                        // Tombol Ya
                                        onPressed: () {
                                          // Aksi saat tombol Ya ditekan
                                          Navigator.push(
                                            // Navigasi ke halaman ProfilePage (misalnya, ke halaman login)
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()), // Halaman ProfilePage
                                          );
                                        },
                                        child: Text(
                                          // Teks tombol Ya
                                          'Ya', // Teks
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
                      // Gaya tombol Log Out
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red), // Warna latar belakang tombol Log Out
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        // Padding tombol Log Out
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        // Bentuk tombol Log Out
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Sudut tombol Log Out
                        ),
                      ),
                    ),
                    child: const Text(
                      // Teks tombol Log Out
                      'KELUAR', // Teks
                      style: TextStyle(
                          color:
                              Color.fromARGB(255, 255, 255, 255)), // Gaya teks
                    ),
                  ),
                  const SizedBox(
                    // Spasi horizontal
                    width: 10,
                  ),
                  ElevatedButton(
                    // Tombol Edit
                    onPressed: () {
                      // Aksi saat tombol Edit ditekan
                      showDialog(
                        // Tampilkan dialog konfirmasi
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            // Dialog untuk konfirmasi Edit Profil
                            shape: RoundedRectangleBorder(
                              // Bentuk dialog
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              // Container dalam dialog
                              width: 300,
                              height: 96,
                              decoration: BoxDecoration(
                                // Dekorasi container dalam dialog
                                color: Color(0xFFCEE7FD),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                // Widget kolom untuk menyusun elemen secara vertikal dalam container
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Susunan elemen mulai dari tengah
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, // Susunan elemen mulai dari tengah
                                children: [
                                  Text(
                                    // Teks konfirmasi Edit Profil
                                    'Yakin Edit Profil?', // Teks konfirmasi
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
                                    // Baris untuk tombol Ya dan Kembali
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, // Susunan elemen mulai dari tengah
                                    children: [
                                      ElevatedButton(
                                        // Tombol Kembali
                                        onPressed: () {
                                          // Aksi saat tombol Kembali ditekan
                                          Navigator.of(context)
                                              .pop(); // Tutup dialog
                                        },
                                        child: Text(
                                          // Teks tombol Kembali
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
                                        // Tombol Ya
                                        onPressed: () {
                                          // Aksi saat tombol Ya ditekan
                                          Navigator.push(
                                            // Navigasi ke halaman ProfileEditPage (misalnya, halaman edit profil)
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileEditPage()), // Halaman ProfileEditPage
                                          );
                                        },
                                        child: Text(
                                          // Teks tombol Ya
                                          'Ya', // Teks
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
                      // Gaya tombol Edit
                      backgroundColor: MaterialStateProperty.all<Color>(Color(
                          0xFF0068D7)), // Warna latar belakang tombol Edit
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        // Padding tombol Edit
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        // Bentuk tombol Edit
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Sudut tombol Edit
                        ),
                      ),
                    ),
                    child: const Text('EDIT', // Teks tombol Edit
                        style: TextStyle(
                            color: Color.fromARGB(
                                255, 255, 255, 255))), // Gaya teks
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
