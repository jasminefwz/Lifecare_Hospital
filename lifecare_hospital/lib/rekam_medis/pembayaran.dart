import 'package:flutter/material.dart';
import '../beranda/beranda.dart';
import '../rekam_medis/PilihPasien.dart';
import '../rekam_medis/RekamMedis.dart';
import 'package:google_fonts/google_fonts.dart';

class PilihPembayaran extends StatefulWidget {
  // final Patient selectedPatient; // Tambahkan parameter selectedPatient
  // PilihPembayaran(
  //     {required this.selectedPatient}); // Konstruktor dengan parameter selectedPatient

  // Mendeklarasikan kelas PilihPembayaran sebagai StatefulWidget
  @override
  _PilihPembayaranState createState() =>
      _PilihPembayaranState(); // Membuat objek _PilihPembayaranState
}

class _PilihPembayaranState extends State<PilihPembayaran> {
  //gunakan selectedPatient untuk menampilkan informasi pasien
  // final Patient selectedPatient;
  // _PilihPembayaranState({required this.selectedPatient});

  // Mendeklarasikan kelas _PilihPembayaranState sebagai State<PilihPembayaran>
  int? selectedBankIndex; // Indeks bank yang dipilih
  int? selectedWalletIndex; // Indeks e-wallet yang dipilih

  // Daftar nomor rekening untuk setiap bank atau e-wallet
  final List<String> bankAccountNumbers = [
    '1234567890', // BCA
    '2345678901', // BNI
    '3456789012', // BRI
    '4567890123', // Mandiri
  ];

  final List<String> ewalletAccountNumbers = [
    '0987654321', // DANA
    '9876543210', // Gopay
    '8765432109', // Shopeepay
    '7654321098', // OVO
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'PILIH METODE PEMBAYARAN',
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
          // onPressed: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => RekamMedis(
          //             selectedPatient:
          //                 selectedPatient)), //mengarah kembali ke halaman PilihPasien
          //   );
          // },
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        toolbarHeight: 87,
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              'Total pembayaran: ',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              "Transfer Bank", // Judul untuk transfer bank
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold, // Teks tebal
              ),
              textAlign: TextAlign.start,
            ),
          ),
          buildBankTransferContainer("BCA",
              logo: 'assets/images/bca.png',
              index: 0), // Membangun kontainer untuk transfer bank BCA
          buildBankTransferContainer("BNI",
              logo: 'assets/images/bni.png',
              index: 1), // Membangun kontainer untuk transfer bank BNI
          buildBankTransferContainer("BRI",
              logo: 'assets/images/bri.png',
              index: 2), // Membangun kontainer untuk transfer bank BRI
          buildBankTransferContainer("Mandiri",
              logo: 'assets/images/mandiri.png',
              index: 3), // Membangun kontainer untuk transfer bank Mandiri
          SizedBox(height: 10), // Jarak antara elemen-elemen
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              "Transfer E-Wallet", // Judul untuk transfer e-wallet
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          buildEwalletContainer("DANA",
              logo: 'assets/images/dana.png',
              index: 0), // Membangun kontainer untuk e-wallet DANA
          buildEwalletContainer("Gopay",
              logo: 'assets/images/gopay.png',
              index: 1), // Membangun kontainer untuk e-wallet Gopay
          buildEwalletContainer("Shopeepay",
              logo: 'assets/images/shopeepay.png',
              index: 2), // Membangun kontainer untuk e-wallet Shopeepay
          buildEwalletContainer("OVO",
              logo: 'assets/images/ovo.png',
              index: 3), // Membangun kontainer untuk e-wallet OVO
          SizedBox(height: 10), // Jarak antara elemen
          GestureDetector(
            // Widget untuk menangani sentuhan
            onTap: () {
              if (selectedBankIndex != null || selectedWalletIndex != null) {
                // Jika bank atau e-wallet dipilih
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Pembayaran()), // Arahkan ke halaman pembayaran
                );
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: (selectedBankIndex != null ||
                        selectedWalletIndex != null)
                    ? Color(0xFF0068D7)
                    : Colors
                        .grey, // Warna latar belakang sesuai dengan pemilihan
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              alignment: Alignment.center,
              child: Text(
                "Konfirmasi", // Teks untuk tombol konfirmasi
                style: TextStyle(
                  color: Colors.white, // Warna teks putih
                  fontWeight: FontWeight.bold, // Teks tebal
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBankTransferContainer(String bankName,
      {required String logo, required int index}) {
    // Widget untuk membangun kontainer transfer bank
    bool isBankSelected = selectedBankIndex == index; // Cek apakah bank dipilih

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedBankIndex =
                  isBankSelected ? null : index; // Toggle pemilihan bank
              selectedWalletIndex = null; // Hapus pemilihan e-wallet jika ada
            });
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: isBankSelected
                  ? Color(0xFF0068D7)
                  : Color(
                      0xFFCEE7FD), // Warna latar belakang kontainer sesuai dengan pemilihan bank
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Image.asset(
                    logo,
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  bankName,
                  style: TextStyle(
                    color: isBankSelected
                        ? Colors.white
                        : Colors
                            .black, // Warna teks sesuai dengan pemilihan bank
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isBankSelected) // Menampilkan kotak nomor rekening jika bank dipilih
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Nomor Rekening: ${bankAccountNumbers[index]}", // Menampilkan nomor rekening bank yang dipilih
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold, // Teks tebal
              ),
            ),
          ),
      ],
    );
  }

  Widget buildEwalletContainer(String walletName,
      {required String logo, required int index}) {
    // Widget untuk membangun kontainer e-wallet
    bool isWalletSelected =
        selectedWalletIndex == index; // Cek apakah e-wallet dipilih

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedWalletIndex =
                  isWalletSelected ? null : index; // Toggle pemilihan e-wallet
              selectedBankIndex =
                  null; // Hapus pemilihan transfer bank jika ada
            });
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: isWalletSelected
                  ? Color(0xFF0068D7)
                  : Color(
                      0xFFCEE7FD), // Warna latar belakang kontainer sesuai dengan pemilihan e-wallet
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Image.asset(
                    logo,
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  walletName,
                  style: TextStyle(
                    color: isWalletSelected
                        ? Colors.white
                        : Colors
                            .black, // Warna teks sesuai dengan pemilihan e-wallet
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isWalletSelected) // Menampilkan kotak nomor e-wallet jika e-wallet dipilih
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Nomor E-Wallet: ${ewalletAccountNumbers[index]}", // Menampilkan nomor e-wallet yang dipilih
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold, // Teks tebal
              ),
            ),
          ),
      ],
    );
  }
}

class Pembayaran extends StatelessWidget {
  // final Patient selectedPatient; // Tambahkan parameter selectedPatient
  Pembayaran(); // Konstruktor dengan parameter selectedPatient

  // Kelas Pembayaran yang merupakan widget StatelessWidget
  @override
  Widget build(BuildContext context) {
    // Fungsi untuk membangun tampilan widget
    return Scaffold(
      // Mengembalikan widget Scaffold sebagai tampilan utama
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'PEMBAYARAN',
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
          icon: Icon(Icons.close),
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
      body: Center(
        // Konten utama halaman ditengah layar
        child: Column(
          // Widget kolom untuk menata konten
          mainAxisAlignment: MainAxisAlignment
              .center, // Posisi konten utama di tengah vertikal
          children: [
            // Daftar widget anak di dalam kolom
            Expanded(
              // Widget yang dapat memperluas diri untuk mengisi ruang yang tersedia
              child: Center(
                // Pusatkan konten di dalam Expanded
                child: Column(
                  // Widget kolom di dalam Expanded untuk menata konten tengah
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Posisi konten utama di tengah vertikal
                  children: [
                    // Daftar widget anak di dalam kolom
                    SizedBox(
                      // Widget untuk menentukan ukuran kotak kosong
                      width: 200.0, // Lebar kotak kosong
                      height: 200.0, // Tinggi kotak kosong
                      child: Image.asset(
                        // Widget gambar dari asset
                        'assets/images/berhasil.png', // Lokasi asset gambar
                        fit: BoxFit.cover, // Penyesuaian gambar ke kotak
                      ),
                    ),
                    SizedBox(height: 20), // Jarak antara gambar dan teks
                    Text(
                      // Teks pertama
                      "Terima Kasih", // Isi teks pertama
                      style: TextStyle(
                        // Gaya teks untuk teks pertama
                        color: Colors.black, // Warna teks pertama
                        fontWeight: FontWeight.bold, // Ketebalan teks pertama
                        fontSize: 16, // Ukuran teks pertama
                      ),
                    ),
                    Text(
                      // Teks kedua
                      "Pembayaran telah berhasil!", // Isi teks kedua
                      style: TextStyle(
                        // Gaya teks untuk teks kedua
                        color: Colors.black, // Warna teks kedua
                        fontWeight: FontWeight.bold, // Ketebalan teks kedua
                        fontSize: 16, // Ukuran teks kedua
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
