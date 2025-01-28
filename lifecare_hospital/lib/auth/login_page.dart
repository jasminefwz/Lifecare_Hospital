import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import '../beranda/beranda.dart'; // Mengimpor file 'beranda.dart'
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool showError = false;
  bool isPasswordVisible = false;

  Future<void> _handleLogin() async {
    final url = 'http://127.0.0.1:8000/auth/login';
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      'username': username,
      'password': password,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        // Navigate to HomePage if login is successful
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  BerandaPage()), // Mengarahkan ke BerandaPage
          (route) => false, // Menghapus semua halaman di atasnya
        );
      } else {
        // Show error dialog if login fails
        _showErrorDialog();
      }
    } catch (e) {
      // Handle network or other errors
      print('Error: $e');
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFCEE7FD),
          title: Center(
            child: Text(
              "Kata Sandi Salah!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: Text(
            "Username atau kata sandi yang Anda masukkan salah.",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0068D7),
                  ),
                  child: Text(
                    'Kembali',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showError = false;
                    });
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0068D7),
                  ),
                  child: Text(
                    'Login Ulang',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Selamat Datang di Life Care Hospital!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Username',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              username = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            prefixStyle: TextStyle(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Kata Sandi',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            prefixStyle: TextStyle(
                              color: Colors.transparent,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            // Navigate to reset password page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPasswordPage()),
                            );
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                'Lupa Kata Sandi?',
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: _handleLogin,
                          child: Text(
                            'Masuk',
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0068D7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 80,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to Register page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: Text(
                            'Daftar',
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0068D7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 80,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          if (showError)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFCEE7FD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Kata Sandi Salah!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showError = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
                              backgroundColor: Color(0xFF0068D7),
                            ),
                            child: Text(
                              'Kembali',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showError = false;
                              });
                              // Reset fields or any other action required for login again
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
                              backgroundColor: Color(0xFFF93A4C),
                            ),
                            child: Text(
                              'Login Ulang',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Kata Sandi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Masukkan Nomor Telepon yang sudah terdaftar!',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFCEE7FD), // Warna latar belakang biru muda
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none, // Hapus border
                ),
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pilih Metode Verifikasi',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman reset password OTP
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResetPasswordOTPPage()),
                );
              },
              child: Text(
                'Verifikasi melalui WhatsApp ke +62xxxxxxx',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color(0xFF0068D7), // Warna latar belakang hijau WhatsApp
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 90,
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman reset password OTP
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResetPasswordOTPPage()),
                );
              },
              child: Text(
                'Verifikasi melalui Missed Call ke +62xxxxxxx',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0068D7), // Warna latar belakang biru
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 90,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResetPasswordOTPPage extends StatefulWidget {
  @override
  _ResetPasswordOTPPageState createState() => _ResetPasswordOTPPageState();
}

class _ResetPasswordOTPPageState extends State<ResetPasswordOTPPage> {
  late List<TextEditingController> controllers;
  bool canResend = false;
  late Timer _resendTimer;
  int _timerCount = 60;

  @override
  void initState() {
    super.initState();
    // Inisialisasi kontroler untuk setiap TextFormField
    controllers = List.generate(
      6,
      (index) => TextEditingController(),
    );

    // Set canResend menjadi true saat halaman pertama kali dimuat
    canResend = true;
  }

  @override
  void dispose() {
    // Hapus kontroler ketika widget di dispose
    for (var controller in controllers) {
      controller.dispose();
    }
    // Hentikan timer jika widget di dispose
    _resendTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Kata Sandi',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Masukkan Kode OTP',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => buildCodeTextFormField(index),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol "Verifikasi" ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewPasswordPage()), // Navigasi ke halaman new password
                );
              },
              child: Text(
                'Verifikasi',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0068D7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 80,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              canResend
                  ? 'Belum Mendapatkan Kode?'
                  : 'Kirim Ulang dalam $_timerCount detik',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              onPressed: canResend ? () => resendCode() : null,
              child: Text(
                'Kirim Ulang Kode',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0068D7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCodeTextFormField(int index) {
    return Container(
      width: 50,
      child: TextFormField(
        controller: controllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        autofocus: index == 0, // Fokus langsung ke kotak pertama
        style: TextStyle(
          fontSize: 24, // Ukuran teks kode
          fontWeight: FontWeight.bold, // Ketebalan teks kode
        ),
        decoration: InputDecoration(
          filled: true, // Mengisi latar belakang kotak kode
          fillColor: Color(0xFFCEE7FD), // Warna latar belakang biru
          counter: Offstage(),
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Hapus border
          ),
        ),
        obscureText: true, // Menyembunyikan masukan teks
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            // Pindah fokus ke kotak selanjutnya jika kotak pertama terisi
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  // Method untuk mengirim ulang kode
  void resendCode() {
    setState(() {
      canResend =
          false; // Menonaktifkan tombol kirim ulang saat proses pengiriman ulang berlangsung
      _timerCount = 60; // Setel ulang hitungan timer
    });

    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timerCount--; // Kurangi hitungan timer setiap detik
        if (_timerCount == 0) {
          timer.cancel(); // Hentikan timer saat mencapai 0
          canResend =
              true; // Aktifkan kembali tombol kirim ulang setelah timer selesai
        }
      });
    });
  }
}

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  bool _isPasswordVisible = false; // State untuk melacak visibilitas kata sandi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Masukkan Password Baru',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Masukkan Kata Sandi Baru',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFFCEE7FD), // Warna latar belakang biru muda
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                // TextField untuk masukkan kata sandi baru
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Masukkan Ulang Kata Sandi Baru',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFFCEE7FD), // Warna latar belakang biru muda
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                // TextField untuk masukkan ulang kata sandi baru
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Menampilkan dialog pemberitahuan berhasil reset password
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor:
                          Color(0xFFCEE7FD), // Warna latar belakang biru muda
                      contentPadding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      content: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Reset Password Berhasil',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Kata sandi Anda telah berhasil direset.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Aksi saat tombol ditekan
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                              },
                              child: Text(
                                'Masuk',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF0068D7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                'Reset',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0068D7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime? _selectedDate;
  int? _selectedGender;
  String name = '';
  String nik = '';
  String tempatLahir = '';
  String alamat = '';
  String phoneNumber = '';
  String email = '';
  String username = '';
  String password = '';
  bool isAllFieldsFilled = false;
  bool _isObscure = true;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: Color(0xFF0068D7),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
      _checkFields();
    }
  }

  String _passwordStrength() {
    if (password.isEmpty) {
      return '';
    } else if (password.length < 8) {
      return 'Kata Sandi Lemah';
    } else {
      return 'Kata Sandi Kuat';
    }
  }

  Color _passwordStrengthColor() {
    if (password.isEmpty) {
      return Colors.black;
    } else if (password.length < 8) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  void _checkFields() {
    setState(() {
      isAllFieldsFilled = name.isNotEmpty &&
          nik.isNotEmpty &&
          tempatLahir.isNotEmpty &&
          alamat.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          email.isNotEmpty &&
          username.isNotEmpty &&
          password.isNotEmpty &&
          _selectedDate != null &&
          _selectedGender != null;
    });
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFCEE7FD),
          title: Center(
            child: Text(
              "Konfirmasi Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: Text(
            "Apakah Data yang Anda isi sudah benar?",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0068D7),
                  ),
                  child: Text(
                    'Kembali',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _register();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0068D7),
                  ),
                  child: Text(
                    'Lanjutkan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _register() async {
    if (isAllFieldsFilled) {
      Map<String, dynamic> requestData = {
        "nama_user": name,
        "nik_user": nik,
        "tmpt_lahir_user": tempatLahir,
        "tl_user": _selectedDate?.toIso8601String(),
        "jk_user": _selectedGender == 1 ? "P" : "L",
        "alamat_user": alamat,
        "telp_user": phoneNumber,
        "email_user": email,
        "pass_user": password,
        "username": username // Assuming username is derived from email
      };

      try {
        final response = await http.post(
          Uri.parse('http://127.0.0.1:8000/auth/register/'),
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
          body: json.encode(requestData),
        );

        if (response.statusCode == 200) {
          var responseData = json.decode(response.body);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        } else {
          _showErrorDialog('Pendaftaran Gagal',
              'Terjadi kesalahan saat mendaftarkan akun. Kode status: ${response.statusCode}');
        }
      } catch (e) {
        _showErrorDialog('Pendaftaran Gagal',
            'Tidak dapat terhubung ke server. Kesalahan: $e');
      }
    } else {
      _showErrorDialog(
          'Pendaftaran Gagal', 'Harap isi semua kolom dengan benar.');
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text("Tutup"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nama Lengkap',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                  _checkFields();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Masukkan nama lengkap Anda',
                  filled: true,
                  fillColor: Color(0xFFCEE7FD),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'NIK',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    nik = value;
                  });
                  _checkFields();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Masukkan NIK Anda',
                  filled: true,
                  fillColor: Color(0xFFCEE7FD),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tempat Lahir',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    tempatLahir = value;
                  });
                  _checkFields();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Masukkan tempat lahir Anda',
                  filled: true,
                  fillColor: Color(0xFFCEE7FD),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tanggal Lahir',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Pilih tanggal lahir Anda',
                      filled: true,
                      fillColor: Color(0xFFCEE7FD),
                    ),
                    controller: TextEditingController(
                      text: _selectedDate != null
                          ? "${_selectedDate!.toLocal()}".split(' ')[0]
                          : '',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Jenis Kelamin',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text('Perempuan'),
                      value: 1,
                      groupValue: _selectedGender,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedGender = value;
                        });
                        _checkFields();
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text('Laki-Laki'),
                      value: 2,
                      groupValue: _selectedGender,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedGender = value;
                        });
                        _checkFields();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Alamat',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    alamat = value;
                  });
                  _checkFields();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Masukkan alamat Anda',
                  filled: true,
                  fillColor: Color(0xFFCEE7FD),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Nomor Telepon',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                  _checkFields();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Masukkan nomor telepon Anda',
                  filled: true,
                  fillColor: Color(0xFFCEE7FD),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Email',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                  _checkFields();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Masukkan email Anda',
                  filled: true,
                  fillColor: Color(0xFFCEE7FD),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Username',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                  _checkFields();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Masukkan username Anda',
                  filled: true,
                  fillColor: Color(0xFFCEE7FD),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Kata Sandi',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                obscureText: _isObscure,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                  _checkFields();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Masukkan kata sandi Anda',
                  filled: true,
                  fillColor: Color(0xFFCEE7FD),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                _passwordStrength(),
                style: TextStyle(
                  color: _passwordStrengthColor(),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: isAllFieldsFilled ? _showConfirmationDialog : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0068D7),
                ),
                child: Text(
                  'Daftar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verifikasi Akun',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Masukkan No. Telepon yang sudah terdaftar!',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFCEE7FD), // Background color biru muda
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none, // Hapus border
                ),
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pilih Metode Verifikasi',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman verifikasi kode OTP ketika tombol ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerificationCodePage(),
                  ),
                );
              },
              child: Text(
                'Verifikasi melalui WhatsApp ke +62xxxxxxx',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0068D7), // Background color biru
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 90,
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman verifikasi kode OTP ketika tombol ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerificationCodePage(),
                  ),
                );
              },
              child: Text(
                'Verifikasi melalui Missed Call ke +62xxxxxxx',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0068D7), // Background color biru
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 90,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationCodePage extends StatefulWidget {
  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  late List<TextEditingController> controllers;
  bool canResend = false;
  late Timer _resendTimer;
  int _timerCount = 60;

  @override
  void initState() {
    super.initState();
    // Inisialisasi kontroler untuk setiap TextFormField
    controllers = List.generate(
      6,
      (index) => TextEditingController(),
    );

    // Set canResend menjadi true saat halaman pertama kali dimuat
    canResend = true;
  }

  @override
  void dispose() {
    // Hapus kontroler ketika widget di dispose
    for (var controller in controllers) {
      controller.dispose();
    }
    // Hentikan timer jika widget di dispose
    _resendTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verifikasi Kode OTP',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Masukkan Kode OTP',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => buildCodeTextFormField(index),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol "Buat Akun" ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuccessPage(patientNumber: 'xxxx'),
                  ),
                );
              },
              child: Text(
                'Buat Akun',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0068D7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 80,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              canResend
                  ? 'Belum Mendapatkan Kode?'
                  : 'Kirim Ulang dalam $_timerCount detik',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              onPressed: canResend ? () => resendCode() : null,
              child: Text(
                'Kirim Ulang Kode',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0068D7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCodeTextFormField(int index) {
    return Container(
      width: 50,
      child: TextFormField(
        controller: controllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        autofocus: index == 0, // Fokus langsung ke kotak pertama
        style: TextStyle(
          fontSize: 24, // Ukuran teks kode
          fontWeight: FontWeight.bold, // Ketebalan teks kode
        ),
        decoration: InputDecoration(
          filled: true, // Mengisi latar belakang kotak kode
          fillColor: Color(0xFFCEE7FD), // Warna latar belakang biru
          counter: Offstage(),
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Hapus border
          ),
        ),
        obscureText: true, // Menyembunyikan masukan teks
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            // Pindah fokus ke kotak selanjutnya jika kotak pertama terisi
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  // Method untuk mengirim ulang kode
  void resendCode() {
    setState(() {
      canResend =
          false; // Menonaktifkan tombol kirim ulang saat proses pengiriman ulang berlangsung
      _timerCount = 60; // Setel ulang hitungan timer
    });

    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timerCount--; // Kurangi hitungan timer setiap detik
        if (_timerCount == 0) {
          timer.cancel(); // Hentikan timer saat mencapai 0
          canResend =
              true; // Aktifkan kembali tombol kirim ulang setelah timer selesai
        }
      });
    });
  }
}

class SuccessPage extends StatelessWidget {
  final String patientNumber;

  SuccessPage({required this.patientNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun Berhasil Dibuat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Akun berhasil dibuat!',
              style: TextStyle(
                fontSize: 24, // Perbesar ukuran teks
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Jarak antara dua teks
            Text(
              'Selamat! Akun Anda dengan No. Pasien $patientNumber Sudah Aktif!',
              style: TextStyle(
                fontSize: 18, // Perbesar ukuran teks
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20), // Jarak antara teks dan tombol
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol "Masuk" ditekan
                // Navigasi ke halaman login
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage()), // Ganti LoginPage dengan halaman login yang sesuai
                );
              },
              child: Text(
                'Masuk',
                style: TextStyle(
                  fontSize: 16, // Perbesar ukuran teks
                  color: Colors.white, // Warna tulisan putih
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0068D7), // Warna latar belakang biru
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 80, // Sesuaikan dengan tombol lainnya
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Beranda'),
//       ),
//       body: Center(
//         child: Text(
//           'Selamat Datang di Beranda!',
//           style: GoogleFonts.nunito(
//             textStyle: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
