// lib/views/kategori_page.dart

import 'package:flutter/material.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({Key? key}) : super(key: key); // Menambahkan key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Menampilkan 2 kolom
        padding: EdgeInsets.all(16.0),
        children: [
          _buildCategoryItem('Lari', Icons.directions_run),
          _buildCategoryItem('Squat', Icons.accessibility),
          _buildCategoryItem('Melompat', Icons.sports),
          _buildCategoryItem('Crab Walk', Icons.directions_walk),
          _buildCategoryItem('Yoga', Icons.self_improvement),
          _buildCategoryItem('Sepak Bola', Icons.sports_soccer),
          _buildCategoryItem('Gimnastik', Icons.sports_gymnastics),
          _buildCategoryItem('Bersepeda', Icons.directions_bike),
          _buildCategoryItem('Inline Skate', Icons.snowboarding),
          _buildCategoryItem('Renang', Icons.pool),
          _buildCategoryItem('Bola Basket', Icons.sports_basketball),
          _buildCategoryItem('Kasti', Icons.sports_baseball),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Tindakan saat kategori ditekan
          print('$title tapped');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
