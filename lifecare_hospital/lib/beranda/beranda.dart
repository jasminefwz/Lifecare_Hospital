import 'package:flutter/material.dart'; // Mengimpor paket dasar flutter untuk membangun UI
import 'package:flutter/widgets.dart'; // Mengimpor paket dasar flutter untuk widget
import 'package:google_fonts/google_fonts.dart';
import '../beranda/notifikasi.dart';
import '../beranda/informasi.dart';
import '../medcheck/medcheck_page.dart'; // Impor halaman medical check up
import '../janji_temu/janji_temu.dart'; // Impor halaman janji temu
import '../profil/profile_page.dart';
import '../rekam_medis/PilihPasien.dart'; // Impor halaman pilih pasien untuk rekam medis
import 'package:http/http.dart' as http;
import 'dart:convert';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  int _selectedIndex = 0; // Indeks terpilih untuk bottom navigation bar

  final List<Widget> _pages = [
    BerandaContent(), // Halaman Beranda
    JanjiTemu(), // Halaman Janji Temu
    PilihPasien(), // Halaman Rekam Medis
    ProfilePage(), // Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Mengubah indeks terpilih
      if (index == 1) {
        // Navigasi ke halaman Janji Temu tanpa menyertakan Scaffold BerandaPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => JanjiTemu()),
        );
      } else if (index == 2) {
        // Navigasi ke halaman Rekam Medis tanpa menyertakan Scaffold BerandaPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PilihPasien()),
        );
      } else if (index == 3) {
        // Navigasi ke halaman Profil tanpa menyertakan Scaffold BerandaPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 8.0),
                child: SizedBox(
                  height: 70,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2.0, top: 10.0),
                  child: Text(
                    'Life Care Hospital',
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0, top: 7.0),
              child: IconButton(
                icon: Image.asset(
                  'assets/images/notifikasi.png',
                  width: 60,
                  height: 60,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/beranda.png',
              width: 30,
              height: 30,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/janjiTemu.png',
              width: 30,
              height: 30,
            ),
            label: 'Janji Temu',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/rekamMedis.png',
              width: 30,
              height: 30,
            ),
            label: 'Rekam Medis',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/profil.png',
              width: 30,
              height: 30,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class BerandaContent extends StatefulWidget {
  @override
  _BerandaContentState createState() => _BerandaContentState();
}

class _BerandaContentState extends State<BerandaContent> {
  List<dynamic> articles = [];

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/artikels/getartikel'),
      headers: {'accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      setState(() {
        articles = json.decode(response.body);
      });
    } else {
      // Handle error response
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Ratu Syahirah!',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  height: 1.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMenuItem(
                  'assets/images/janjiTemu.png', 'Buat Janji', 'Temu', () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          JanjiTemu()), // Mengarahkan kembali ke halaman utama
                );
              }),
              _buildMenuItem(
                  'assets/images/informasiRS.png', 'Informasi', 'Rumah Sakit',
                  () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          InformasiRumahSakit()), // Mengarahkan kembali ke halaman utama
                );
              }),
              _buildMenuItem('assets/images/medical.png', 'Medical', 'Check-Up',
                  () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyHomePage()), // Mengarahkan kembali ke halaman utama
                );
              }),
            ],
          ),
          SizedBox(height: 45.0),
          Column(
            children: [
              Text(
                'Berita Terkini',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 35.0),
              Container(
                height: 250.0,
                child: articles.isEmpty
                    ? Center(
                        child:
                            CircularProgressIndicator()) // Show loading indicator while fetching data
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          final artikel = articles[index];
                          return _buildNewsItem(
                            context,
                            artikel['judul_artikel'],
                            artikel['foto_artikel'],
                          );
                        },
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String imagePath, String firstText, String secondText,
      VoidCallback onTap) {
    // Fungsi untuk membuat item menu
    return Column(
      // Widget kolom untuk menata item menu
      children: [
        // Daftar widget anak di dalam kolom
        GestureDetector(
          // Widget untuk menangkap aksi ketika disentuh
          onTap: onTap, // Aksi yang dilakukan saat item disentuh
          child: Column(
            // Widget kolom untuk menata item menu
            children: [
              // Daftar widget anak di dalam kolom
              Image.asset(
                // Widget gambar dari asset
                imagePath, // Lokasi asset gambar
                width: 120, // Lebar gambar
                height: 120, // Tinggi gambar
              ),
              SizedBox(height: 5.0), // Jarak antara elemen
              Text(
                // Widget teks
                firstText, // Isi teks pertama
                style: TextStyle(
                  // Gaya teks
                  color: Colors.black, // Warna teks
                  fontSize: 19.0, // Ukuran teks
                ),
              ),
              Text(
                // Widget teks
                secondText, // Isi teks kedua
                style: TextStyle(
                  // Gaya teks
                  color: Colors.black, // Warna teks
                  fontSize: 19.0, // Ukuran teks
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNewsItem(BuildContext context, String title, String imagePath) {
    // Fungsi untuk membuat item berita
    return GestureDetector(
      // Widget untuk menangkap aksi ketika disentuh
      onTap: () {
        // Aksi yang dilakukan saat item disentuh
        Navigator.push(
          // Berpindah halaman menggunakan navigator
          context,
          MaterialPageRoute(
              builder: (context) => NewsDetailPage(title: title,
                  imagePath:
                      imagePath)), // Mengarahkan ke halaman detail berita
        );
      },
      child: Container(
        // Widget kontainer untuk menampilkan item berita
        width: 300, // Lebar kontainer
        height: 200, // Tinggi kontainer
        margin: EdgeInsets.symmetric(horizontal: 10.0), // Margin pada kontainer
        child: Stack(
          // Widget tumpukan untuk menata konten secara bersarang
          children: [
            // Daftar widget anak di dalam tumpukan
            Image.asset(
              // Widget gambar dari asset
              imagePath, // Lokasi asset gambar
              width: double.infinity, // Lebar gambar mengisi kontainer
              height: double.infinity, // Tinggi gambar mengisi kontainer
              fit: BoxFit.cover, // Penyesuaian gambar ke kontainer
            ),
            Positioned(
              // Widget yang memposisikan anaknya relatif terhadap tata letak lainnya
              left: 0, // Posisi anak dari kiri
              right: 0, // Posisi anak dari kanan
              bottom: 40, // Posisi anak dari bawah
              child: Text(
                // Widget teks
                title, // Isi teks
                style: TextStyle(
                  // Gaya teks
                  color: Colors.white, // Warna teks
                  fontSize: 19.0, // Ukuran teks
                  fontWeight: FontWeight.bold, // Ketebalan teks
                  shadows: [
                    // Efek bayangan pada teks
                    Shadow(
                      // Bayangan teks
                      color: Colors.black.withOpacity(0.5), // Warna bayangan
                      blurRadius: 2, // Radius blur bayangan
                      offset: Offset(5, 2), // Perpindahan bayangan
                    ),
                  ],
                ),
                textAlign: TextAlign.center, // Penataan teks
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  // Kelas NewsDetailPage yang merupakan widget StatelessWidget
  final String title; // Judul berita
  final String imagePath; // Path gambar berita

  NewsDetailPage(
      {required this.title,
      required this.imagePath}); // Konstruktor dengan parameter wajib

  @override
  Widget build(BuildContext context) {
    // Fungsi untuk membangun tampilan widget
    return Scaffold(
      // Mengembalikan widget Scaffold sebagai tampilan utama
      appBar: AppBar(
        // AppBar pada halaman detail berita
        title: Text('Berita Terkini'), // Judul AppBar
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
              // Widget kontainer untuk menampilkan gambar berita
              height: 200, // Tinggi kontainer
              decoration: BoxDecoration(
                // Dekorasi kontainer
                image: DecorationImage(
                  // Gambar latar belakang
                  image: AssetImage(imagePath), // Gambar dari asset
                  fit: BoxFit.cover, // Penyesuaian gambar ke kontainer
                ),
              ),
            ),
            Padding(
              // Widget untuk memberikan padding
              padding: EdgeInsets.all(16.0), // Padding pada semua sisi
              child: Text(
                // Widget teks
                title, // Judul berita
                style: TextStyle(
                  // Gaya teks
                  fontSize: 24, // Ukuran teks
                  fontWeight: FontWeight.bold, // Ketebalan teks
                ),
              ),
            ),
            Padding(
              // Widget untuk memberikan padding
              padding: const EdgeInsets.all(16.0), // Padding pada semua sisi
              child: _buildNewsContent(
                  title), // Memanggil fungsi untuk menampilkan konten berita
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsContent(String title) {
    // Fungsi untuk menampilkan konten berita berdasarkan judul
    if (title
        .contains('3 Fase saat Sakit Demam Berdarah dan Cara Menanganinya')) {
      // Jika judul berita mengandung teks tertentu
      return _buildDBDContent(); // Memanggil fungsi untuk menampilkan konten berita DBD
    } else if (title.contains('Protein Hewani Cegah Stunting')) {
      // Jika judul berita mengandung teks tertentu
      return _buildStuntingContent(); // Memanggil fungsi untuk menampilkan konten berita stunting
    } else if (title.contains(
        'Kunjungi Rumah Singgah YKAKI, Menkes Ingatkan Pentingnya Deteksi Dini')) {
      // Jika judul berita mengandung teks tertentu
      return _buildRumahSinggahContent(); // Memanggil fungsi untuk menampilkan konten berita rumah singgah
    } else {
      // Jika judul berita tidak sesuai dengan yang diharapkan
      return Text(
          'Konten tidak ditemukan'); // Menampilkan teks konten tidak ditemukan
    }
  }

  Widget _buildDBDContent() {
    // Fungsi untuk menampilkan konten berita tentang DBD
    return Column(
      // Widget kolom untuk menata konten
      crossAxisAlignment: CrossAxisAlignment.start, // Penataan lintas sumbu
      children: [
        // Daftar widget anak di dalam kolom
        SizedBox(height: 8), // Jarak antara elemen
        Text(
          // Widget teks
          'Kasus demam berdarah dengue (DBD) di beberapa wilayah di Indonesia kini tengah mengalami kenaikan. Oleh karena itu, penting untuk mengetahui tiga fase yang akan dilalui pasien saat sakit DBD dan cara menanganinya. DBD merupakan jenis penyakit yang memiliki beberapa tingkatan.\n\n'
          'DBD memiliki tiga fase diantaranya fase demam, fase kritis, dan fase pemulihan. Ketiga fase ini perlu diketahui agar dapat dilakukan pemeriksaan serta pengobatan yang lebih optimal.\n\n'
          'Berdarah Dengue (DBD) memiliki tiga fase yang penting untuk diketahui:\n\n'
          '1. Fase Demam (Febrile Phase):\n'
          '   - Ditandai dengan demam tinggi yang persisten, biasanya mencapai 40 derajat Celsius.\n'
          '   - Gejala lain termasuk mual, muntah, sakit kepala, ruam merah, nyeri otot dan sendi, serta sakit tenggorokan.\n'
          '   - Trombosit dalam darah dapat mengalami penurunan drastis hingga di bawah 100.000 per mikroliter darah.\n'
          '   - Membutuhkan perawatan medis untuk mendapatkan obat dan penanganan yang sesuai.\n\n'
          '2. Fase Kritis (Critical Phase):\n'
          '   - Fase paling berbahaya dalam DBD.\n'
          '   - Ditandai dengan demam mulai membaik dan tubuh kembali normal, seringkali disertai penurunan suhu tubuh.\n'
          '   - Meskipun demikian, fase ini membawa risiko pendarahan dan kebocoran plasma darah yang dapat berakibat fatal.\n'
          '   - Terjadi sekitar 3 hingga 7 hari setelah fase pertama muncul.\n'
          '   - Gejalanya meliputi pendarahan pada hidung atau gusi, serta penurunan tekanan darah yang drastis.\n'
          '   - Memerlukan perhatian khusus dari dokter yang berpengalaman.\n\n'
          '3. Fase Pemulihan (Recovery Phase):\n'
          '   - Merupakan fase di mana cairan yang keluar dari pembuluh darah akan kembali masuk ke dalam pembuluh darah.\n'
          '   - Trombosit dalam darah akan meningkat kembali hingga mencapai kadar normal sekitar 150.000 mikroliter darah.\n'
          '   - Meskipun tidak memerlukan perhatian khusus, disarankan untuk banyak istirahat karena tubuh masih lemah.\n'
          '   - Disarankan untuk istirahat selama lima hari.\n'
          '   - Virus dengue masih dapat bertahan dalam tubuh hingga tiga minggu setelah fase pemulihan dimulai.\n\n'
          'Penting bagi masyarakat, terutama orang tua, untuk memperhatikan dan mengenali tanda-tanda dari setiap fase DBD agar pasien dapat menerima penanganan yang tepat hingga sembuh sepenuhnya.',
        ),
      ],
    );
  }

  Widget _buildStuntingContent() {
    // Fungsi untuk menampilkan konten berita tentang stunting
    return Column(
      // Widget kolom untuk menata konten
      crossAxisAlignment: CrossAxisAlignment.start, // Penataan lintas sumbu
      children: [
        // Daftar widget anak di dalam kolom
        SizedBox(height: 8), // Jarak antara elemen
        Text(
          // Widget teks
          'Stunting adalah salah satu masalah kesehatan yang masih banyak kita temukan di Indonesia, yaitu sekitar 21,6% (SSGI 2022). Meski demikian, Kementerian Kesehatan optimis untuk bisa melakukan Prevalensi stunting hingga mencapai 14% pada tahun 2024. Sehingga dengan demikian, pemerintah akan terus mengupayakan penurunan stunting sebanyak 2,7 persen setiap tahunnya.\n\n'
          'Adapun upaya yang dilakukan oleh Kementerian Kesehatan, salah satunya adalah dengan mengangkat tema “Protein Hewani Cegah Stunting” pada Hari Gizi Nasional ke-63 pada tahun ini. Perlu diketahui bahwa protein hewani adalah instrumen gizi yang dibutuhkan oleh ibu hamil guna mencegah stunting pada anak, hal ini dikarenakan pangan hewani mempunyai kandungan zat gizi yang lengkap, kaya protein hewani dan vitamin yang sangat penting dalam mendukung pertumbuhan dan perkembangan.',
        ),
      ],
    );
  }

  Widget _buildRumahSinggahContent() {
    // Fungsi untuk menampilkan konten berita tentang rumah singgah
    return Column(
      // Widget kolom untuk menata konten
      crossAxisAlignment: CrossAxisAlignment.start, // Penataan lintas sumbu
      children: [
        // Daftar widget anak di dalam kolom
        SizedBox(height: 8), // Jarak antara elemen
        Text(// Widget teks
            'Mentri Kesehatan Budi Sadikin kunjungi Rumah Singgah “Rumah Harapan Bangsa” YKAKI di Kemayoran, Jakarta Pusat. Kunjungan ini bertujuan untuk mengingatkan pentingnya deteksi dini dan penanganan kanker dengan memanfaatkan teknologi.\n\n'
            'Teknologi berperan besar dalam deteksi dini kanker, pemeriksaan PSA, kanker payudara, hingga kolonoskopi, yang mana peralatan ini ada di rumah singgah ini, dan sangat membantu untuk penanganan awal.\n\n'
            '“Saya ingin teman-teman sekalian untuk terus melakukan deteksi dini, sebab deteksi dini itu sangat penting,” kata Budi.\n\n'
            'Kunjungan ini juga menjadi bentuk apresiasi Menteri Kesehatan terhadap peran Rumah Singgah YKAKI dalam membantu penanganan awal penderita kanker. Dimana Rumah Singgah YKAKI adalah rumah singgah terbesar dan lengkap yang dimiliki YKAKI (Yayasan Kanker Indonesia) di Indonesia.'),
      ],
    );
  }
}
