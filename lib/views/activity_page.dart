import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  final String title;

  ActivityPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Menyesuaikan warna AppBar dengan tema
        title: Text(
          'Aktivitas: $title',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            // Menambahkan deskripsi aktivitas
            Text(
              'Deskripsi aktivitas ini memberikan panduan untuk melakukan $title.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            // Progress Bar (Bar kemajuan)
            LinearProgressIndicator(
              value: 0.6, // Menunjukkan progress 60%
              backgroundColor: Colors.grey.shade300,
              color: Colors.green,
            ),
            SizedBox(height: 40),
            // Tombol Selesaikan Aktivitas
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logika ketika aktivitas selesai dapat ditambahkan di sini
                  Navigator.pop(context);
                },
                child: Text('Selesaikan Aktivitas'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Mengganti primary dengan backgroundColor
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
