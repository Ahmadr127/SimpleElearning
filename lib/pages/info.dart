import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jadwal Pelajaran Hari Ini',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.schedule, color: Colors.blue),
                title: Text('Matematika - Kelas 12 IPA', style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Text('08:00 - 10:00'),
              ),
            ),
            Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.schedule, color: Colors.blue),
                title: Text('Fisika - Kelas 12 IPA',style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Text('10:30 - 12:00'),
              ),
            ),
            // Bagian untuk berita atau event terbaru
            SizedBox(height: 20),
            Text(
              'Pekerjaan Rumah Hari Untuk Hari ini',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.event, color: Colors.blue),
                title: Text('Tugas Kelompok fisika',style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Text('Membuat Eksperimen Biologi Rusbe'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.event, color: Colors.blue),
                title: Text('Tugas Perorangan Matematika',style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Text('Menghitung Dosa dengan Statistika'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
