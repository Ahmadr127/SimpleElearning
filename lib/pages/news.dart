import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsScreen extends StatelessWidget {
  final List<NewsItem> newsItems = [
    NewsItem(
      title: 'Lomba Keterampilan Siswa Tingkat Nasional',
      description:
          'SMK kita mengirim 5 siswa terbaik untuk berlomba di ajang nasional.',
      imageUrl: 'https://picsum.photos/seed/news1/800/400',
      date: DateTime.now().subtract(Duration(days: 1)),
      category: 'Kompetisi',
    ),
    NewsItem(
      title: 'Kunjungan Industri ke PT Teknologi Maju',
      description:
          'Siswa jurusan TKJ berkesempatan melihat langsung operasional data center.',
      imageUrl: 'https://picsum.photos/seed/news2/800/400',
      date: DateTime.now().subtract(Duration(days: 3)),
      category: 'Kunjungan',
    ),
    NewsItem(
      title: 'Workshop Kewirausahaan Digital',
      description:
          'Belajar membangun startup dari para ahli industri teknologi.',
      imageUrl: 'https://picsum.photos/seed/news3/800/400',
      date: DateTime.now().subtract(Duration(days: 5)),
      category: 'Workshop',
    ),
    NewsItem(
      title: 'Peluncuran Lab Komputer Baru',
      description:
          'SMK kita melengkapi fasilitas dengan 30 unit komputer terbaru.',
      imageUrl: 'https://picsum.photos/seed/news4/800/400',
      date: DateTime.now().subtract(Duration(days: 7)),
      category: 'Fasilitas',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Berita Terkini SMKN 4', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          return _buildNewsCard(newsItems[index]);
        },
      ),
    );
  }

  Widget _buildNewsCard(NewsItem item) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.network(
              item.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildCategoryChip(item.category),
                    Spacer(),
                    Text(
                      DateFormat('d MMM yyyy').format(item.date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item.description,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getCategoryColor(category),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        category,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'kompetisi':
        return Colors.orange;
      case 'kunjungan':
        return Colors.green;
      case 'workshop':
        return Colors.purple;
      case 'fasilitas':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

class NewsItem {
  final String title;
  final String description;
  final String imageUrl;
  final DateTime date;
  final String category;

  NewsItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.category,
  });
}
