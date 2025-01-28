import 'package:flutter/material.dart'; // Mengimpor package flutter material
import 'package:google_fonts/google_fonts.dart';
import '../beranda/beranda.dart';

class InformasiRumahSakit extends StatelessWidget {
  // Kelas InformasiRumahSakit yang merupakan widget StatelessWidget
  @override
  Widget build(BuildContext context) {
    // Fungsi untuk membangun tampilan widget
    return MaterialApp(
      // Mengembalikan widget MaterialApp sebagai tampilan utama
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      home: Scaffold(
        // Menggunakan widget Scaffold sebagai tampilan utama
        appBar: AppBar(
          backgroundColor: Color(0xFF0068D7),
          title: Text(
            'INFORMASI RUMAH SAKIT',
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
            //menggunakan icon arrow back
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
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
        body: SingleChildScrollView(
          // Konten utama halaman dengan kemampuan menggulung
          child: Column(
            // Widget kolom untuk menata konten
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Penataan lintas sumbu
            children: [
              // Daftar widget anak di dalam kolom
              Container(
                // Kontainer untuk informasi kontak
                color: Colors.white, // Warna latar belakang kontainer
                padding: EdgeInsets.all(30.0), // Padding di dalam kontainer
                child: Column(
                  // Widget kolom untuk menata konten
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Penataan lintas sumbu
                  children: [
                    // Daftar widget anak di dalam kolom
                    Row(
                      // Baris untuk menampilkan nomor telepon
                      children: [
                        // Daftar widget anak di dalam baris
                        Image.asset(
                          // Menampilkan gambar dari asset
                          'assets/images/telepon.png', // Path gambar
                          width: 50.0, // Lebar gambar
                          height: 50.0, // Tinggi gambar
                        ),
                        SizedBox(width: 15.0), // Jarak antara elemen
                        Column(
                          // Widget kolom untuk menata konten
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // Penataan lintas sumbu
                          children: [
                            // Daftar widget anak di dalam kolom
                            Text(
                              // Widget teks
                              "Hubungi kami", // Teks informasi kontak
                              style: GoogleFonts.poppins(
                                // Gaya teks
                                fontSize: 16.0, // Ukuran teks
                                color: Colors.black, // Warna teks
                              ),
                            ),
                            Text(
                              // Widget teks
                              "(022) 2870024", // Nomor telepon
                              style: GoogleFonts.poppins(
                                // Gaya teks
                                fontSize: 16.0, // Ukuran teks
                                color: Colors.black, // Warna teks
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0), // Jarak antara elemen
                    Row(
                      // Baris untuk menampilkan alamat email
                      children: [
                        // Daftar widget anak di dalam baris
                        Container(
                          // Kontainer untuk gambar email
                          decoration: BoxDecoration(
                            // Dekorasi kontainer
                            boxShadow: [
                              // Efek bayangan
                              BoxShadow(
                                // Bayangan
                                color: Colors.black
                                    .withOpacity(0.1), // Warna bayangan
                                spreadRadius: 1, // Penyebaran bayangan
                                blurRadius: 28, // Radius blur bayangan
                                offset: Offset(1, 5), // Penempatan bayangan
                              ),
                            ],
                          ),
                          child: Image.asset(
                            // Menampilkan gambar dari asset
                            'assets/images/email.png', // Path gambar
                            width: 60.0, // Lebar gambar
                            height: 60.0, // Tinggi gambar
                          ),
                        ),
                        SizedBox(width: 15.0), // Jarak antara elemen
                        Text(
                          // Widget teks
                          "lifecarehospital@gmail.com", // Alamat email
                          style: GoogleFonts.poppins(
                            // Gaya teks
                            fontSize: 16.0, // Ukuran teks
                            color: Colors.black, // Warna teks
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0), // Jarak antara elemen
              Center(
                // Widget untuk menengahkan elemen
                child: Padding(
                  // Widget untuk memberikan padding
                  padding: EdgeInsets.symmetric(
                      horizontal: 30.0), // Padding horizontal
                  child: Container(
                    // Kontainer untuk informasi lokasi rumah sakit
                    width: double.infinity, // Lebar kontainer
                    decoration: BoxDecoration(
                      // Dekorasi kontainer
                      color:
                          Color(0xFFCEE7FD), // Warna latar belakang kontainer
                      borderRadius:
                          BorderRadius.circular(20.0), // Membuat sudut bulat
                    ),
                    child: Padding(
                      // Widget untuk memberikan padding
                      padding:
                          EdgeInsets.all(24.0), // Padding di dalam kontainer
                      child: Column(
                        // Widget kolom untuk menata konten
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Penataan lintas sumbu
                        children: [
                          // Daftar widget anak di dalam kolom
                          Text(
                            // Widget teks
                            "Lokasi Rumah Sakit", // Judul informasi lokasi rumah sakit
                            style: GoogleFonts.poppins(
                              // Gaya teks
                              fontSize: 16.0, // Ukuran teks
                              color: Colors.black, // Warna teks
                              fontWeight: FontWeight.bold, // Ketebalan teks
                            ),
                          ),
                          SizedBox(height: 10.0), // Jarak antara elemen
                          Row(
                            // Baris untuk menampilkan logo dan nama rumah sakit
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Penataan elemen ke tepi kiri
                            children: [
                              // Daftar widget anak di dalam baris
                              Column(
                                // Widget kolom untuk menata konten
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Penataan lintas sumbu
                                children: [
                                  // Daftar widget anak di dalam kolom
                                  Image.asset(
                                    // Menampilkan gambar dari asset
                                    'assets/images/logo.png', // Path gambar
                                    width: 60.0, // Lebar gambar
                                    height: 60.0, // Tinggi gambar
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.0), // Jarak antara elemen
                              Text(
                                // Widget teks
                                "Life Care Hospital", // Nama rumah sakit
                                style: GoogleFonts.poppins(
                                  // Gaya teks
                                  fontSize: 16.0, // Ukuran teks
                                  color: Colors.black, // Warna teks
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0), // Jarak antara elemen
                          Text(
                            // Widget teks
                            "Jalan Jl. Ir. H. Juanda No.100, Lebakgede, Kecamatan Coblong, Kota Bandung, Jawa Barat 40132", // Alamat rumah sakit
                            style: GoogleFonts.poppins(
                              // Gaya teks
                              fontSize: 16.0, // Ukuran teks
                              color: Colors.black, // Warna teks
                            ),
                          ),
                        ],
                      ),
                    ),
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
