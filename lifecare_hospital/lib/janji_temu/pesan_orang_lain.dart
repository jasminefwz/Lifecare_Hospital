import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../janji_temu/pesan_sendiri.dart';
import '../beranda/beranda.dart';
import '../riwayat_pendaftaran/RiwayatDaftar.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

//membuat kelas PilihOrangLain yang merupakan StatefulWidget
class PilihOrangLain extends StatefulWidget {
  //override method createState untuk membuat objek dari kelas _PilihOrangLain
  @override
  _PilihOrangLain createState() => _PilihOrangLain();
}

//membuat kelas _PilihOrangLain yang merupakan State dari PilihOrangLain
class _PilihOrangLain extends State<PilihOrangLain> {
  //buat list untuk menyimpan data pasien
  List<PatientProfile> patients = [
    PatientProfile(
        name: 'Marvel Ravindra',
        nik: '323465618297253',
        tmptlahir: 'Bandung',
        dob: '24 Des 2003',
        gender: 'Laki-laki',
        alamat: 'Jalan Bubat',
        notelp: '080098765432'),
    PatientProfile(
        name: 'Rifanny Lysara',
        nik: '3227324618898765',
        tmptlahir: 'Bekasi',
        dob: '29 Nov 2004',
        gender: 'Perempuan',
        alamat: 'Jalan Pano',
        notelp: '083726393923'),
  ];

  //method build untuk membangun tampilan widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //membuat appbar pilih pasien
      appBar: AppBar(
        //background appbar
        backgroundColor: Color(0xFF0068D7),
        //judul appbar
        title: Text(
          'PILIH PASIEN',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        //untuk menempatkan judul di tengah app bar
        centerTitle: true,
        //tombol di sebelah kiri app bar
        leading: IconButton(
          //menggunakan icon close
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
        toolbarHeight: 87, //tinggi app bar
      ),
      body: SingleChildScrollView(
        //widget scroll
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 0,
            ),

            //data pasien menggunakan ListView.builder
            SizedBox(height: 3),
            ListView.builder(
              shrinkWrap:
                  true, //agar ListView hanya mengonsumsi ruang yang diperlukan
              physics: NeverScrollableScrollPhysics(),
              itemCount: patients.length, //jumlah item dalam ListView
              //membangun item dalam ListView
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        //implementasi ketika container diklik
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DataOrangLain(
                                  selectedPatient: patients[
                                      index])), //mengarahkan ke halaman data orang lain sesuai dengan pasien yang telah dipilih
                        );
                      },
                      //container untuk menampilkan detail pasien
                      child: Container(
                        width: 350,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFCEE7FD),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //nampilin profil
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 38, left: 12, right: 12),
                              child: Image.asset(
                                'assets/images/profil.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            //nampilin line
                            Container(
                              height: 137,
                              width: 1,
                              color: Colors.black,
                            ),
                            //nampilin data pasien
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //baris untuk no pasien
                                    Row(
                                      children: [
                                        Text(
                                          'NIK : ${patients[index].nik}',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    //baris untuk nama pasien
                                    Row(
                                      children: [
                                        Text(
                                          'Nama Pasien    : ${patients[index].name}',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    //baris untuk tanggal lahir
                                    Row(
                                      children: [
                                        Text(
                                          'Tanggal Lahir   : ${patients[index].dob}',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    //baris untuk jenis kelamin
                                    Row(
                                      children: [
                                        Text(
                                          'Jenis Kelamin  : ${patients[index].gender}',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            //batas di akhir
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PesanOrangLain()),
                  );
              },
              child: Text(
                'TAMBAH PASIEN', // Teks tombol pesan untuk orang lain
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0068D7), // Warna tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Kelas untuk halaman menampilkan data diri user
class DataOrangLain extends StatefulWidget {
  final PatientProfile selectedPatient;
  DataOrangLain({required this.selectedPatient});

  @override
  _DataOrangLainState createState() =>
      _DataOrangLainState(selectedPatient: selectedPatient);
}

class _DataOrangLainState extends State<DataOrangLain> {
  final PatientProfile selectedPatient;
  _DataOrangLainState({required this.selectedPatient});
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'DATA DIRI',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true, // Untuk menempatkan judul di tengah app bar
        leading: IconButton(
          icon: Image.asset(
            'assets/images/arrowLeft.png',
            width: 15,
            height: 15,
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Aksi yang ingin dilakukan saat tombol panah kembali ditekan
          },
        ),
        toolbarHeight: 87,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nama Lengkap',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${selectedPatient.name}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'NIK',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${selectedPatient.nik}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tempat Lahir',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${selectedPatient.tmptlahir}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tanggal Lahir',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${selectedPatient.dob}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Jenis Kelamin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${selectedPatient.gender}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Alamat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${selectedPatient.alamat}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'No Telepon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '${selectedPatient.notelp}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Color(0xFFCEE7FD),
                        title: Text(
                          'Konfirmasi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content:
                            Text('Apakah Anda Yakin akan Membuat Janji Temu?'),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              // Kembali
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Kembali',
                              style: TextStyle(
                                  color: Colors.white // Ubah warna teks
                                  ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                  0xFF0068D7), // Ganti warna tombol "Ya, Yakin"
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Proses pendaftaran
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RiwayatDaftar()), //mengarahkan kembali ke halaman janji temu
                              );
                            },
                            child: Text(
                              'Ya, Yakin',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white // Ubah warna teks
                                  ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                  0xFF0068D7), // Ganti warna tombol "Ya, Yakin"
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'PESAN',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0068D7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 70,
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

// Kelas untuk menampilkan halaman form untuk melakukan pemesanan untuk orang lain
class PesanOrangLain extends StatefulWidget {
  @override
  _PesanOrangLainState createState() => _PesanOrangLainState();
}

class _PesanOrangLainState extends State<PesanOrangLain> {
  final TextEditingController _fullNameController =
      TextEditingController(); // Definisikan controller untuk nama lengkap
  final TextEditingController _nikController =
      TextEditingController(); // Definisikan controller untuk NIK
  final TextEditingController _tempatLahirController = TextEditingController();

  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();
  final TextEditingController _namaPemesanController = TextEditingController();
  final TextEditingController _noTelpPemesanController =
      TextEditingController();

  int? _selectedGender;
  final TextEditingController _jenisKelaminController = TextEditingController();

  Future<void> _selectGender(BuildContext context) async {
    final result = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Jenis Kelamin'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Laki-laki'),
                onTap: () {
                  Navigator.pop(context, 0);
                },
              ),
              ListTile(
                title: Text('Perempuan'),
                onTap: () {
                  Navigator.pop(context, 1);
                },
              ),
            ],
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedGender = result;
        _jenisKelaminController.text = _selectedGender == 0
            ? 'Laki-laki'
            : 'Perempuan'; // Set nilai pada controller
      });
    }
  }

  DateTime? _selectedDate;
  final TextEditingController _tglLahirController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null)
      setState(() {
        _selectedDate = picked;
        _tglLahirController.text =
            picked.toString().split(' ')[0]; // Atur nilai pada controller
      });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'ISI DATA DIRI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/arrowLeft.png',
            width: 15,
            height: 15,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        toolbarHeight: 87,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Nama Lengkap',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan nama lengkap Anda',
                    filled: true,
                    fillColor: Color(0xFFCEE7FD),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama lengkap harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'NIK',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _nikController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan NIK Anda',
                    filled: true,
                    fillColor: Color(0xFFCEE7FD),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIK harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Tempat Lahir',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _tempatLahirController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan tempat lahir Anda',
                    filled: true,
                    fillColor: Color(0xFFCEE7FD),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tempat lahir harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Tanggal Lahir',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _tglLahirController,
                      decoration: InputDecoration(
                        hintText: 'Pilih tanggal lahir Anda',
                        filled: true,
                        fillColor: Color(0xFFCEE7FD),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tanggal lahir harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Jenis Kelamin',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value as int?;
                          _jenisKelaminController.text = 'Laki-laki';
                        });
                      },
                      activeColor: Color(
                          0xFF0068D7), // Mengatur warna biru tua saat dipilih
                    ),
                    Text('Laki-laki'),
                    Radio(
                      value: 1,
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value as int?;
                          _jenisKelaminController.text = 'Perempuan';
                        });
                      },
                      activeColor: Color(
                          0xFF0068D7), // Mengatur warna biru tua saat dipilih
                    ),
                    Text('Perempuan'),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Alamat',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  maxLines: 3,
                  controller: _alamatController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan alamat lengkap Anda',
                    filled: true,
                    fillColor: Color(0xFFCEE7FD),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'No Telepon',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _noTelpController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan nomor telepon Anda',
                    filled: true,
                    fillColor: Color(0xFFCEE7FD),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor telepon harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Nama Pemesan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _namaPemesanController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nama Pemesan',
                    filled: true,
                    fillColor: Color(0xFFCEE7FD),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama pemesan harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'No Telepon Pemesan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _noTelpPemesanController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan nomor telepon Pemesan',
                    filled: true,
                    fillColor: Color(0xFFCEE7FD),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor telepon harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataDiriPage(
                            fullName: _fullNameController.text,
                            nik: _nikController.text,
                            tempatLahir: _tempatLahirController.text,
                            tglLahir: _tglLahirController.text,
                            jenisKelamin: _jenisKelaminController.text,
                            alamat: _alamatController.text,
                            noTelp: _noTelpController.text,
                            namaPemesan: _namaPemesanController.text,
                            noTelpPemesan: _noTelpController.text,
                          ),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Color(0xFFCEE7FD),
                            title: Text(
                              'Error',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text('Semua data diri harus diisi.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(
                                      0xFF0068D7), // Ganti warna tombol "Ya, Yakin"
                                ),
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                      color: Colors.white // Ubah warna teks
                                      ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    'SIMPAN',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0068D7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 70,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Kelas untuk menampilkan DataDiri
class DataDiriPage extends StatelessWidget {
  final String fullName;
  final String nik;
  final String tempatLahir;
  final String tglLahir;
  final String jenisKelamin;
  final String alamat;
  final String noTelp;
  final String namaPemesan;
  final String noTelpPemesan;

  const DataDiriPage(
      {Key? key,
      required this.fullName,
      required this.nik,
      required this.tempatLahir,
      required this.tglLahir,
      required this.jenisKelamin,
      required this.alamat,
      required this.noTelp,
      required this.namaPemesan,
      required this.noTelpPemesan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0068D7),
        title: Text(
          'DATA DIRI',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true, // Untuk menempatkan judul di tengah app bar
        leading: IconButton(
          icon: Image.asset(
            'assets/images/arrowLeft.png',
            width: 15,
            height: 15,
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Aksi yang ingin dilakukan saat tombol panah kembali ditekan
          },
        ),
        toolbarHeight: 87,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nama Lengkap',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '$fullName',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'NIK',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '$nik',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tempat Lahir',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '$tempatLahir',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tanggal Lahir',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '$tglLahir',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Jenis Kelamin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '$jenisKelamin',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Alamat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '$alamat',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'No Telepon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '$noTelp',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Nama Pemesan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '$namaPemesan',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'No Telepon Pemesan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // Menggunakan font Poppins dan membuat teks menjadi tebal
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFCEE7FD),
                  border: Border.all(
                      color: Colors
                          .grey), // Tambahkan border seperti TextFormField
                  borderRadius: BorderRadius.circular(
                      5), // Atur border radius sesuai kebutuhan
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 12), // Sesuaikan padding
                child: Text(
                  '$noTelpPemesan',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Color(0xFFCEE7FD),
                        title: Text(
                          'Konfirmasi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content:
                            Text('Apakah Anda Yakin akan Membuat Janji Temu?'),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              // Kembali
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Kembali',
                              style: TextStyle(
                                  color: Colors.white // Ubah warna teks
                                  ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                  0xFF0068D7), // Ganti warna tombol "Ya, Yakin"
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Proses pendaftaran
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RiwayatDaftar()), //mengarahkan kembali ke halaman janji temu
                              );
                            },
                            child: Text(
                              'Ya, Yakin',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white // Ubah warna teks
                                  ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                  0xFF0068D7), // Ganti warna tombol "Ya, Yakin"
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'PESAN',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0068D7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 70,
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