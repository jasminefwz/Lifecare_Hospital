import 'package:flutter/material.dart'; // Mengimpor package flutter material
import 'package:google_fonts/google_fonts.dart';
import '../beranda/beranda.dart';

class NotificationPage extends StatelessWidget { // Kelas NotificationPage yang merupakan widget StatelessWidget
  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun tampilan widget
    return Scaffold( // Mengembalikan widget Scaffold sebagai tampilan utama
     appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'NOTIFIKASI',
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
          onPressed: () { // Aksi saat tombol ditekan
              // Mengganti halaman saat ini dengan BerandaPage dan menghapus semua halaman di atasnya dalam tumpukan navigasi
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => BerandaPage()), // Mengarahkan ke BerandaPage
                (route) => false, // Menghapus semua halaman di atasnya
              );
            },
        ),
        toolbarHeight: 87,
      ),
      body: SingleChildScrollView( // Konten utama halaman dengan kemampuan menggulung
        child: ListView( // ListView untuk menampilkan daftar notifikasi
          shrinkWrap: true, // Mengatur ukuran sesuai konten
          padding: EdgeInsets.all(16.0), // Padding di dalam ListView
          children: [ // Daftar notifikasi
            Padding( // Widget untuk memberikan padding
              padding: const EdgeInsets.only(bottom: 16.0), // Padding bawah
              child: Text( // Widget teks
                'Februari 2024', // Teks bulan dan tahun
                style: TextStyle( // Gaya teks
                  fontSize: 20, // Ukuran teks
                  fontWeight: FontWeight.bold, // Ketebalan teks
                ),
              ),
            ),
            NotificationItem( // Widget untuk menampilkan item notifikasi
              title: 'Berhasil Check In', // Judul notifikasi
              dateTime: '22 Februari 2024, 07:00 WIB', // Tanggal dan waktu
              message: // Pesan notifikasi
                  'Yth Ratu Syahirah Khairunnisa, Anda berhasil check in. Silakan pergi ke Nurse station.',
              onTap: () { // Aksi saat notifikasi ditekan
                Navigator.push( // Navigasi ke halaman detail notifikasi
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailNotifikasi( // Halaman detail notifikasi
                      title: 'Berhasil Check In', // Judul notifikasi
                      dateTime: '22 Februari 2024, 07:00 WIB', // Tanggal dan waktu
                      message: // Pesan notifikasi
                          'Yth Ratu Syahirah Khairunnisa, Anda berhasil check in. Silakan pergi ke Nurse station.',
                    ),
                  ),
                );
              },
            ),
            NotificationItem( // Notifikasi lainnya
              title: 'Reminder Janji Temu', // Judul notifikasi
              dateTime: '21 Februari 2024, 20:00 WIB', // Tanggal dan waktu
              message: // Pesan notifikasi
                  'Yth Ratu Syahirah Khairunnisa, Diingatkan untuk jadwal janji temu anda dengan Dr. Jeon Wonwoo (Umum) untuk tanggal 22 Februari 2024 pada pukul 08.00.',
              onTap: () { // Aksi saat notifikasi ditekan
                Navigator.push( // Navigasi ke halaman detail notifikasi
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailNotifikasi( // Halaman detail notifikasi
                      title: 'Reminder Janji Temu', // Judul notifikasi
                      dateTime: '21 Februari 2024, 20:00 WIB', // Tanggal dan waktu  
                      message: // Pesan notifikasi
                          'Yth Ratu Syahirah Khairunnisa, Diingatkan untuk jadwal janji temu anda dengan Dr. Jeon Wonwoo (Umum) untuk tanggal 22 Februari 2024 pada pukul 08.00.',
                    ),
                  ),
                );
              },
            ),
            NotificationItem( // Notifikasi lainnya
              title: 'Janji Temu Berhasil', // Judul notifikasi
              dateTime: '20 Februari 2024, 15:35 WIB', // Tanggal dan waktu
              message: // Pesan notifikasi
                  'Yth Ratu Syahirah Khairunnisa, Janji Temu anda dengan Dr.Jeon Wonwoo (Umum) untuk tanggal 22 Februari 2024 pada pukul 08.00 sudah tercatat.',
              onTap: () { // Aksi saat notifikasi ditekan
                Navigator.push( // Navigasi ke halaman detail notifikasi
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailNotifikasi( // Halaman detail notifikasi
                      title: 'Janji Temu Berhasil', // Judul notifikasi
                      dateTime: '20 Februari 2024, 15:35 WIB', // Tanggal dan waktu
                      message: // Pesan notifikasi
                          'Yth Ratu Syahirah Khairunnisa, janji temu anda dengan Dr.Jeon Wonwoo (Umum) untuk tanggal 22 Februari 2024 pada pukul 08.00 sudah tercatat.',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      
    );
  }
}

class NotificationItem extends StatelessWidget { // Kelas NotificationItem yang merupakan widget StatelessWidget
  final String title; // Judul notifikasi
  final String dateTime; // Tanggal dan waktu notifikasi
  final String message; // Pesan notifikasi
  final VoidCallback onTap; // Aksi saat notifikasi ditekan

  const NotificationItem({ // Konstruktor untuk inisialisasi variabel
    Key? key, // Kunci untuk widget
    required this.title, // Parameter judul notifikasi yang harus disediakan
    required this.dateTime, // Parameter tanggal dan waktu notifikasi yang harus disediakan
    required this.message, // Parameter pesan notifikasi yang harus disediakan
    required this.onTap, // Parameter aksi saat notifikasi ditekan yang harus disediakan
  }) : super(key: key); // Memanggil konstruktor dari kelas induk

  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun tampilan widget
    return GestureDetector( // Widget untuk mendeteksi ketukan
      onTap: onTap, // Aksi ketika widget ditekan
      child: Card( // Widget untuk menampilkan kartu
        elevation: 2, // Elevasi kartu
        margin: EdgeInsets.only(bottom: 16.0), // Margin bawah kartu
        child: Padding( // Widget untuk memberikan padding
          padding: EdgeInsets.all(16.0), // Padding di dalam kartu
          child: Column( // Widget kolom untuk menata konten
            crossAxisAlignment: CrossAxisAlignment.start, // Penataan lintas sumbu
            children: [ // Daftar widget anak di dalam kolom
              Row( // Widget baris untuk menata judul notifikasi
                children: [
                  Image.asset( // Menampilkan gambar dari asset
                    'assets/images/notifikasi.png', // Path gambar
                    width: 24, // Lebar gambar
                    height: 24, // Tinggi gambar
                  ),
                  SizedBox(width: 10), // Spasi horizontal
                  Text( // Widget teks untuk menampilkan judul notifikasi
                    title, // Judul notifikasi
                    style: TextStyle( // Gaya teks
                      fontWeight: FontWeight.bold, // Ketebalan teks
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8), // Spasi vertikal
              Text( // Widget teks untuk menampilkan tanggal dan waktu notifikasi
                dateTime, // Tanggal dan waktu notifikasi
                style: TextStyle( // Gaya teks
                  color: Colors.grey, // Warna teks
                ),
              ),
              SizedBox(height: 8), // Spasi vertikal
              Text( // Widget teks untuk menampilkan pesan notifikasi
                message, // Pesan notifikasi
                style: TextStyle( // Gaya teks
                  fontSize: 16, // Ukuran teks
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailNotifikasi extends StatelessWidget { // Kelas DetailNotifikasi yang merupakan widget StatelessWidget
  final String title; // Judul notifikasi
  final String dateTime; // Tanggal dan waktu notifikasi
  final String message; // Pesan notifikasi

  const DetailNotifikasi({ // Konstruktor untuk inisialisasi variabel
    Key? key, // Kunci untuk widget
    required this.title, // Parameter judul notifikasi yang harus disediakan
    required this.dateTime, // Parameter tanggal dan waktu notifikasi yang harus disediakan
    required this.message, // Parameter pesan notifikasi yang harus disediakan
  }) : super(key: key); // Memanggil konstruktor dari kelas induk

  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun tampilan widget
    return Scaffold( // Mengembalikan widget Scaffold sebagai tampilan utama
     appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'NOTIFIKASI',
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
              // Aksi ketika tombol kembali di klik
              // Navigator untuk kembali ke halaman sebelumnya
              Navigator.pop(context);
            },
        ),
        toolbarHeight: 87,
      ),
      body: Padding( // Widget untuk memberikan padding
        padding: const EdgeInsets.all(16.0), // Padding di dalam badan Scaffold
        child: Column( // Widget kolom untuk menata konten
          crossAxisAlignment: CrossAxisAlignment.start, // Penataan lintas sumbu
          children: [ // Daftar widget anak di dalam kolom
            SizedBox( // Widget kotak kosong untuk mengatur tinggi
              height: 30, // Tinggi kotak kosong
              child: Text( // Widget teks untuk menampilkan judul notifikasi
                title, // Judul notifikasi
                style: TextStyle( // Gaya teks
                  color: Colors.black, // Warna teks
                  fontWeight: FontWeight.bold, // Ketebalan teks
                  fontSize: 25, // Ukuran teks
                ),
              ),
            ),
            SizedBox(height: 8), // Spasi vertikal
            Text( // Widget teks untuk menampilkan tanggal dan waktu notifikasi
              dateTime, // Tanggal dan waktu notifikasi
              style: TextStyle(fontSize: 14), // Gaya teks
            ),
            SizedBox(height: 8), // Spasi vertikal
            Text( // Widget teks untuk menampilkan pesan notifikasi
              message, // Pesan notifikasi
              style: TextStyle(color: Colors.black, fontSize: 22), // Gaya teks
            ),
          ],
        ),
      ),
    );
  }
}
