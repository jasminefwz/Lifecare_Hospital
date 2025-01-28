import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth/login_page.dart'; // Ganti dengan file login page Anda

class OpenApp extends StatefulWidget {
  @override
  _OpenAppState createState() => _OpenAppState();
}

class _OpenAppState extends State<OpenApp> {
  @override
  void initState() {
    super.initState();
    // Timer untuk menunggu beberapa detik sebelum berpindah ke halaman login
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                LoginPage()), // Ganti dengan nama class halaman login Anda
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF98CAFD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ganti dengan logo atau gambar Anda
            Image.asset('assets/images/logo.png', width: 250, height: 250),
            SizedBox(height: 10),
            Text(
              'LIFE CARE',
              // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xFF0068D7),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'HOSPITAL',
              // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xFF0068D7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
