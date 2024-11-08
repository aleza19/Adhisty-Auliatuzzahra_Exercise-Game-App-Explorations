import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String description;
  final String number;
  final VoidCallback onPressed;

  const ExerciseCard({
    Key? key,
    required this.title,
    required this.description,
    required this.number,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.green.shade200, // Warna latar belakang nomor menjadi hijau lembut
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                number,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorDark, // Warna sesuai tema
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey.shade600, // Warna deskripsi lebih lembut
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10), // Menambahkan jarak sebelum tombol
            ElevatedButton(
              onPressed: onPressed,
              child: Text("Let's Go"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor, // Warna tombol sesuai tema
                foregroundColor: Colors.white, // Warna teks tombol
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Padding tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Bentuk tombol melingkar
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
