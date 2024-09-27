import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  final List<String> _images = [ // Daftar URL gambar untuk slideshow
    'https://pusdatin.kemdikbud.go.id/wp-content/uploads/2020/03/banner-rumbel-belajar-di-rumah-1.jpg',
    'https://www.infosatu.co/wp-content/uploads/2020/04/a86b7d14748a1e0618fe64598e8ce7f4.jpg',
    'https://bbppmpvbispar.kemdikbud.go.id/portal/wp-content/uploads/2020/03/belajar-daring-800x445.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardItems = [
      {'icon': Icons.book, 'color': Colors.blue, 'label': 'Perpustakaan', 'screen': LibraryScreen()},
      {'icon': Icons.school, 'color': Colors.red, 'label': 'Kelas', 'screen': ClassroomScreen()},
      {'icon': Icons.assignment, 'color': Colors.orange, 'label': 'Tugas', 'screen': AssignmentScreen()},
      {'icon': Icons.schedule, 'color': Colors.green, 'label': 'Jadwal', 'screen': ScheduleScreen()},
      {'icon': Icons.grade, 'color': Colors.purple, 'label': 'Nilai', 'screen': GradesScreen()},
      {'icon': Icons.calendar_today, 'color': Colors.teal, 'label': 'Kalender', 'screen': CalendarScreen()},
      {'icon': Icons.notifications, 'color': Colors.amber, 'label': 'Notifikasi', 'screen': NotificationScreen()},
      {'icon': Icons.settings, 'color': Colors.grey, 'label': 'Pengaturan', 'screen': SettingsScreen()},
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    _images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Selamat Datang",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    " Ahmad Rifai 👋",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.9,
                ),
                padding: EdgeInsets.all(15),
                itemCount: cardItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => cardItems[index]['screen']),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: cardItems[index]['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        // border: Border.all(color: cardItems[index]['color'], width: 2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            cardItems[index]['icon'],
                            color: cardItems[index]['color'],
                            size: 36,
                          ),
                          SizedBox(height: 8),
                          Text(
                            cardItems[index]['label'],
                            style: TextStyle(color: cardItems[index]['color'], fontSize: 12, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perpustakaan Digital')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Buku Matematika Kelas 10'),
            subtitle: Text('Penerbit: Erlangga'),
            trailing: ElevatedButton(
              child: Text('Baca'),
              onPressed: () {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Fisika Dasar'),
            subtitle: Text('Penerbit: Gramedia'),
            trailing: ElevatedButton(
              child: Text('Baca'),
              onPressed: () {},
            ),
          ),
          // Add more book listings here
        ],
      ),
    );
  }
}

class ClassroomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kelas Virtual')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.video_call),
            title: Text('Kelas Matematika'),
            subtitle: Text('Senin, 10:00 - 11:30'),
            trailing: ElevatedButton(
              child: Text('Masuk'),
              onPressed: () {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.video_call),
            title: Text('Kelas Bahasa Inggris'),
            subtitle: Text('Selasa, 13:00 - 14:30'),
            trailing: ElevatedButton(
              child: Text('Masuk'),
              onPressed: () {},
            ),
          ),
          // Add more virtual classes here
        ],
      ),
    );
  }
}

class AssignmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Tugas')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Tugas Matematika'),
            subtitle: Text('Deadline: 30 September 2024'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Proyek Sains'),
            subtitle: Text('Deadline: 15 Oktober 2024'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          // Add more assignments here
        ],
      ),
    );
  }
}

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jadwal Matapelajaran')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Senin'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('07:00 - 08:30: Matematika'),
                Text('08:45 - 10:15: Bahasa Indonesia'),
                // Add more subjects for Monday
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Selasa'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('07:00 - 08:30: Fisika'),
                Text('08:45 - 10:15: Bahasa Inggris'),
                // Add more subjects for Tuesday
              ],
            ),
          ),
          // Add more days here
        ],
      ),
    );
  }
}

class GradesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nilai Akademik')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Matematika'),
            subtitle: Text('Semester 1'),
            trailing: Text('85', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Bahasa Indonesia'),
            subtitle: Text('Semester 1'),
            trailing: Text('90', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          // Add more subjects and grades here
        ],
      ),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalender Akademik')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Ujian Tengah Semester'),
            subtitle: Text('1 Oktober 2024 - 7 Oktober 2024'),
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Libur Nasional'),
            subtitle: Text('17 Oktober 2024'),
          ),
          // Add more calendar events here
        ],
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifikasi')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('Pengumuman Ujian'),
            subtitle: Text('Jadwal ujian tengah semester telah dirilis.'),
            trailing: Text('1 jam yang lalu'),
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('Tugas Baru'),
            subtitle: Text('Anda memiliki tugas baru untuk mata pelajaran Fisika.'),
            trailing: Text('3 jam yang lalu'),
          ),
          // Add more notifications here
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pengaturan')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifikasi'),
            trailing: Switch(value: true, onChanged: (bool value) {}),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Bahasa'),
            trailing: Text('Bahasa Indonesia'),
            onTap: () {},
          ),
          // Add more settings options here
        ],
      ),
    );
  }
}