import 'package:flutter/material.dart'; // Impor paket flutter untuk membangun UI
import 'package:google_fonts/google_fonts.dart'; // Impor paket Google Fonts untuk gaya teks kustom
import '../profil/profile_page.dart';

class GantiPasswordPage extends StatefulWidget {
  // Widget untuk halaman ganti password
  const GantiPasswordPage({Key? key}) : super(key: key);

  @override
  _GantiPasswordPageState createState() =>
      _GantiPasswordPageState(); // Mengembalikan status halaman ganti password
}

class _GantiPasswordPageState extends State<GantiPasswordPage> {
  // Status untuk halaman ganti password
  bool _isPasswordVisible =
      false; // Variabel untuk menunjukkan apakah password terlihat atau tidak
  bool _isConfirmPasswordVisible =
      false; // Variabel untuk menunjukkan apakah konfirmasi password terlihat atau tidak

  @override
  Widget build(BuildContext context) {
    // Membangun tampilan halaman
    return Scaffold(
      // Scaffold sebagai kerangka utama halaman
      appBar: AppBar(
        // App bar di bagian atas
        backgroundColor: Color(0xFF0068D7), // Warna latar belakang app bar
        title: Text(
          // Judul app bar
          'GANTI PASSWORD', // Teks judul
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
            // Aksi yang ingin dilakukan saat tombol panah kembali ditekan
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        toolbarHeight: 87, // Tinggi toolbar
      ),
      body: Padding(
        // Padding untuk konten halaman
        padding: const EdgeInsets.all(20.0), // Padding sebesar 20
        child: Column(
          // Kolom untuk menyusun elemen secara vertikal
          crossAxisAlignment: CrossAxisAlignment
              .center, // Penyusunan elemen ke tengah secara horizontal
          mainAxisAlignment: MainAxisAlignment
              .center, // Penyusunan elemen ke tengah secara vertikal
          children: [
            // Elemen-elemen dalam kolom
            TextField(
              // Input field untuk password baru
              obscureText:
                  !_isPasswordVisible, // Teks password tersembunyi atau terlihat
              decoration: InputDecoration(
                // Dekorasi input field
                labelText: 'Password Baru', // Label input field
                suffixIcon: InkWell(
                  // Icon untuk mengubah visibilitas password
                  onTap: () {
                    // Aksi saat ikon ditekan
                    setState(() {
                      // Atur ulang state
                      _isPasswordVisible =
                          !_isPasswordVisible; // Ubah visibilitas password
                    });
                  },
                  child: Icon(
                    // Ikon yang menunjukkan visibilitas password
                    _isPasswordVisible // Pilih ikon berdasarkan visibilitas password
                        ? Icons.visibility // Ikon terlihat
                        : Icons.visibility_off, // Ikon tersembunyi
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Spasi vertikal sebesar 20
            TextField(
              // Input field untuk konfirmasi password baru
              obscureText:
                  !_isConfirmPasswordVisible, // Teks konfirmasi password tersembunyi atau terlihat
              decoration: InputDecoration(
                // Dekorasi input field
                labelText: 'Konfirmasi Password Baru', // Label input field
                suffixIcon: InkWell(
                  // Icon untuk mengubah visibilitas konfirmasi password
                  onTap: () {
                    // Aksi saat ikon ditekan
                    setState(() {
                      // Atur ulang state
                      _isConfirmPasswordVisible =
                          !_isConfirmPasswordVisible; // Ubah visibilitas konfirmasi password
                    });
                  },
                  child: Icon(
                    // Ikon yang menunjukkan visibilitas konfirmasi password
                    _isConfirmPasswordVisible // Pilih ikon berdasarkan visibilitas konfirmasi password
                        ? Icons.visibility // Ikon terlihat
                        : Icons.visibility_off, // Ikon tersembunyi
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Spasi vertikal sebesar 20
            ElevatedButton(
              // Tombol untuk menyimpan perubahan password
              onPressed: () {
                // Aksi saat tombol ditekan
                showDialog(
                  // Tampilkan dialog konfirmasi
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      // Dialog konfirmasi
                      shape: RoundedRectangleBorder(
                        // Bentuk dialog
                        borderRadius: BorderRadius.circular(10), // Sudut dialog
                      ),
                      child: Container(
                        // Konten dalam dialog
                        width: 300, // Lebar konten
                        height: 96, // Tinggi konten
                        decoration: BoxDecoration(
                          // Dekorasi konten
                          color:
                              Color(0xFFCEE7FD), // Warna latar belakang konten
                          borderRadius:
                              BorderRadius.circular(10), // Sudut konten
                        ),
                        child: Column(
                          // Kolom untuk menyusun elemen secara vertikal dalam konten
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Penyusunan elemen ke tengah secara vertikal
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Penyusunan elemen ke tengah secara horizontal
                          children: [
                            // Elemen-elemen dalam kolom
                            Text(
                              // Teks konfirmasi
                              'Yakin SIMPAN PERUBAHAN ?', // Teks konfirmasi
                              textAlign:
                                  TextAlign.center, // Penyusunan teks ke tengah
                              style: TextStyle(
                                // Gaya teks
                                fontFamily: 'Poppins', // Font teks
                                fontWeight: FontWeight.w600, // Ketebalan teks
                              ),
                            ),
                            SizedBox(height: 20), // Spasi vertikal sebesar 20
                            Row(
                              // Baris untuk tombol "Ya, Simpan Perubahan" dan "Kembali"
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Penyusunan elemen ke tengah secara horizontal
                              children: [
                                ElevatedButton(
                                  // Tombol "Ya, Simpan Perubahan"
                                  onPressed: () {
                                    // Aksi saat tombol ditekan
                                    Navigator.push(
                                      // Navigasi kembali ke halaman profil
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfilePage()),
                                    );
                                  },
                                  child: Text(
                                    // Teks tombol "Ya, Simpan Perubahan"
                                    'Ya, Simpan Perubahan', // Teks
                                    textAlign: TextAlign
                                        .center, // Penyusunan teks ke tengah
                                    style: TextStyle(
                                      // Gaya teks
                                      color: Colors.white, // Warna teks
                                      fontFamily: 'Poppins', // Font teks
                                      fontWeight:
                                          FontWeight.w600, // Ketebalan teks
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    // Gaya tombol
                                    backgroundColor: Color(
                                        0xFF0068D7), // Warna latar belakang tombol
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20), // Padding tombol
                                  ),
                                ),
                                SizedBox(
                                    width: 20), // Spasi horizontal sebesar 20
                                ElevatedButton(
                                  // Tombol "Kembali"
                                  onPressed: () {
                                    // Aksi saat tombol ditekan
                                    Navigator.of(context).pop(); // Tutup dialog
                                  },
                                  child: Text(
                                    // Teks tombol "Kembali"
                                    'Kembali', // Teks
                                    textAlign: TextAlign
                                        .center, // Penyusunan teks ke tengah
                                    style: TextStyle(
                                      // Gaya teks
                                      color: Colors.white, // Warna teks
                                      fontFamily: 'Poppins', // Font teks
                                      fontWeight:
                                          FontWeight.w600, // Ketebalan teks
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    // Gaya tombol
                                    backgroundColor: Color(
                                        0xFF0068D7), // Warna latar belakang tombol
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20), // Padding tombol
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
                // Gaya tombol
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF0068D7)), // Warna latar belakang tombol
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(
                      vertical: 15, horizontal: 20), // Padding tombol
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Sudut tombol
                  ),
                ),
              ),
              child: const Text(
                // Teks tombol
                'SIMPAN PERUBAHAN', // Teks
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255)), // Gaya teks
              ),
            ),
          ],
        ),
      ),
    );
  }
}
