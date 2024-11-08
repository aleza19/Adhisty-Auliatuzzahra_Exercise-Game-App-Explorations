import 'package:flutter/material.dart';

class LeaderboardTile extends StatelessWidget {
  final String name;
  final int points;
  final int position;

  LeaderboardTile({required this.name, required this.points, required this.position});

  @override
  Widget build(BuildContext context) {
    // Warna dan ikon khusus untuk tiga besar
    Color positionColor;
    IconData icon;
    if (position == 1) {
      positionColor = Colors.amber;
      icon = Icons.star; // Ikon bintang untuk posisi 1
    } else if (position == 2) {
      positionColor = Colors.grey;
      icon = Icons.emoji_events; // Ikon piala untuk posisi 2
    } else if (position == 3) {
      positionColor = Colors.brown;
      icon = Icons.emoji_events; // Ikon piala untuk posisi 3
    } else {
      positionColor = Theme.of(context).colorScheme.secondary.withOpacity(0.5); // Warna posisi lainnya
      icon = Icons.person; // Ikon umum untuk posisi di luar tiga besar
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        color: Theme.of(context).scaffoldBackgroundColor, // Latar belakang kartu mengikuti tema
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: positionColor,
            child: Text(
              position.toString(),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          title: Row(
            children: [
              Icon(icon, color: positionColor, size: 20),
              SizedBox(width: 8),
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColorDark, // Warna teks sesuai tema
                ),
              ),
            ],
          ),
          trailing: Text(
            '$points pts',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor, // Warna poin sesuai tema
            ),
          ),
        ),
      ),
    );
  }
}
