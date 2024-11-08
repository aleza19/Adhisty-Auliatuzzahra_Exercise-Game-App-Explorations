import 'package:flutter/material.dart';
import 'views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.green, // Warna utama: Hijau
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: Colors.green.shade800, 
        ),
        scaffoldBackgroundColor: Colors.green.shade50, // Warna latar belakang yang lembut
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green, // AppBar mengikuti warna utama
          foregroundColor: Colors.white, // Warna teks dan ikon di AppBar
          elevation: 0,
        ),
        iconTheme: IconThemeData(
          color: Colors.green.shade800, // Warna ikon default menjadi ungu
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Warna tombol utama menjadi hijau
            foregroundColor: Colors.white, // Warna teks pada tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.green.shade900), // Warna teks utama menjadi hijau tua
          bodyMedium: TextStyle(color: Colors.green.shade800), // Warna teks sekunder menjadi hijau tua
          titleLarge: TextStyle(
            color: Colors.green.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
