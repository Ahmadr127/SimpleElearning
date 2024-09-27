import 'package:flutter/material.dart'; // Mengimpor paket Material Design Flutter
import '../pages/home.dart'; // Mengimpor file home.dart yang berisi halaman HomeScreen
import '../pages/info.dart'; // Mengimpor file info.dart yang berisi halaman InfoScreen
import '../pages/profile.dart'; // Mengimpor file profile.dart yang berisi halaman ProfileScreen
import '../pages/news.dart'; // Mengimpor file news.dart yang berisi halaman NewsScreen
import 'login.dart'; // Mengimpor file login.dart yang berisi halaman LoginScreen

// ===================== CLASS WelcomeScreen =======================
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() =>
      _WelcomeScreenState(); // Membuat state untuk WelcomeScreen
}

// =================== STATE dari WelcomeScreen =====================
class _WelcomeScreenState extends State<WelcomeScreen> {
  // Variabel untuk melacak indeks tab yang dipilih
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan berdasarkan tab yang dipilih
  final List<Widget> _pages = [
    HomeScreen(), // Halaman HomeScreen
    InfoScreen(), // Halaman InfoScreen
    ProfileScreen(), // Halaman ProfileScreen
    NewsScreen(), // Halaman NewsScreen
  ];

  // Fungsi untuk mengganti tab yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Mengubah indeks tab yang dipilih
    });
  }

  // Fungsi untuk melakukan logout dan kembali ke halaman login
  void _logout() {
    // Mengarahkan pengguna ke halaman LoginScreen dan mengganti halaman saat ini
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LoginScreen()), // Arahkan ke halaman LoginScreen
    );
  }

  // ======================= BUILD METHOD ==========================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===================== APPBAR ===========================
      appBar: AppBar(
        title: Text(
          'SMK Negeri 4 Mobile Apps', // Judul aplikasi
          style: TextStyle(
            color: Color.fromARGB(255, 246, 246, 248), // Warna teks putih
            fontWeight: FontWeight.bold, // Memberikan gaya tebal pada teks
            fontSize: 20, // Ukuran teks 15
          ),
        ),
        // centerTitle: true, // Menempatkan judul di tengah AppBar
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.blueAccent, // Warna latar belakang AppBar biru
        elevation: 4, // Memberikan bayangan pada AppBar
        shadowColor: Colors.black
            .withOpacity(0.5), // Warna bayangan hitam setengah transparan
      ),

      // ===================== DRAWER (SIDEBAR) ===========================
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent, // Warna latar belakang header
              ),
              child: Text(
                'Menu', // Judul pada header drawer
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), // Ikon untuk item Home
              title: Text('Home'),
              onTap: () {
                _onItemTapped(0); // Mengubah ke tab Home
                Navigator.pop(context); // Menutup drawer setelah item dipilih
              },
            ),
            ListTile(
              leading: Icon(Icons.info), // Ikon untuk item Info
              title: Text('Info'),
              onTap: () {
                _onItemTapped(1); // Mengubah ke tab Info
                Navigator.pop(context); // Menutup drawer setelah item dipilih
              },
            ),
            ListTile(
              leading: Icon(Icons.person), // Ikon untuk item Profile
              title: Text('Profile'),
              onTap: () {
                _onItemTapped(2); // Mengubah ke tab Profile
                Navigator.pop(context); // Menutup drawer setelah item dipilih
              },
            ),
            ListTile(
              leading: Icon(Icons.article), // Ikon untuk item News
              title: Text('News'),
              onTap: () {
                _onItemTapped(3); // Mengubah ke tab News
                Navigator.pop(context); // Menutup drawer setelah item dipilih
              },
            ),
            Divider(), // Pembatas
            ListTile(
              leading: Icon(Icons.logout), // Ikon untuk logout
              title: Text('Logout'),
              onTap: _logout, // Panggil fungsi logout
            ),
          ],
        ),
      ),

      // ===================== BODY ===========================
      body: _pages[
          _selectedIndex], // Menampilkan halaman berdasarkan indeks tab yang dipilih

      // ============== BOTTOM NAVIGATION BAR =================
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // Daftar item navigasi bawah
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk tab Home
            label: 'Home', // Label untuk tab Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // Ikon untuk tab Info
            label: 'Info', // Label untuk tab Info
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon untuk tab Profile
            label: 'Profile', // Label untuk tab Profile
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article), // Ikon untuk tab News
            label: 'News', // Label untuk tab News
          ),
        ],
        currentIndex: _selectedIndex, // Menandakan tab yang saat ini dipilih
        selectedItemColor: Colors.blue, // Warna untuk item yang dipilih
        unselectedItemColor: Colors.grey, // Warna untuk item yang tidak dipilih
        onTap: _onItemTapped, // Fungsi yang dipanggil saat tab diklik
        showUnselectedLabels:
            true, // Menampilkan label pada item yang tidak dipilih
      ),
    );
  }
}
