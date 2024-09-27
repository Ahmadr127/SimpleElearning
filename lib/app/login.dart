import 'package:flutter/material.dart';
import 'welcome.dart';

// Kelas utama untuk tampilan Login
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// State untuk kelas LoginScreen
class _LoginScreenState extends State<LoginScreen> {
  // Kontroler untuk menangani input teks
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Kunci untuk form validasi
  String? _errorMessage; // Pesan error jika login gagal

  // Fungsi untuk menangani proses login
  void _login() {
    // Validasi form
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text; // Ambil username
      String password = _passwordController.text; // Ambil password

      // Cek apakah username dan password sesuai
      if (username == 'admin' && password == '123') {
        // Jika login sukses, navigasi ke WelcomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      } else {
        // Jika login gagal, tampilkan pesan error
        setState(() {
          _errorMessage = 'Username atau Password salah';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900], // Warna AppBar menjadi gelap
      ),
      backgroundColor: Colors.blue[900], // Warna background agak gelap
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding untuk tampilan
        child: Center(
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey, // Kunci untuk validasi form
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ukuran minimum kolom
                  children: [
                    // ================================
                    // Icon di atas teks SMK Negeri
                    // ================================
                    Icon(Icons.school,
                        size: 80,
                        color:
                            Colors.blue), // Ganti dengan icon yang diinginkan
                    SizedBox(height: 10), // Jarak antar elemen

                    // ================================
                    // Teks SMK Negeri
                    // ================================
                    Text(
                      'SMK Negeri 4 Elearning',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center, // Pusatkan teks
                    ),
                    SizedBox(height: 20), // Jarak antar elemen

                    // ================================
                    // Field untuk memasukkan username
                    // ================================
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(
                          color: Colors.black), // Teks input menjadi putih
                      validator: (value) {
                        // Validasi input username
                        if (value == null || value.isEmpty) {
                          return 'Masukkan Username'; // Pesan jika kosong
                        }
                        return null;
                      },
                    ),

                    // ================================
                    // Field untuk memasukkan password
                    // ================================
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(
                          color: Colors.black), // Teks input menjadi putih
                      obscureText: true, // Tampilkan input sebagai titik
                      validator: (value) {
                        // Validasi input password
                        if (value == null || value.isEmpty) {
                          return 'Masukkan Password'; // Pesan jika kosong
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20), // Jarak antar elemen

                    // ================================
                    // Tampilkan pesan error jika ada
                    // ================================
                    if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style: TextStyle(
                            color: Colors.red), // Teks merah untuk error
                      ),
                    SizedBox(height: 20), // Jarak antar elemen

                    // ================================
                    // Tombol untuk melakukan login
                    // ================================
                    SizedBox(
                      width: double
                          .infinity, // Lebar tombol sama dengan lebar card
                      child: ElevatedButton(
                        onPressed: _login, // Panggil fungsi login saat ditekan
                        child: Text('Login',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Warna tombol biru
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
