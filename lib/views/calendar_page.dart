import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // Impor paket table_calendar

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key); // Menambahkan key parameter

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _selectedDay; // Untuk menyimpan tanggal yang dipilih
  late DateTime _focusedDay; // Untuk fokus pada hari saat ini

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now(); // Set tanggal yang dipilih ke hari ini
    _focusedDay = DateTime.now(); // Fokus pada hari ini
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalender'), // Judul halaman Kalender
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1), // Tanggal awal kalender
            lastDay: DateTime.utc(2030, 12, 31), // Tanggal akhir kalender
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day); // Menandai hari yang dipilih
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay; // Perbarui hari yang dipilih
                _focusedDay = focusedDay; // Fokus pada hari yang dipilih
              });
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.green, // Warna untuk hari yang dipilih
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.lightGreen, // Warna untuk hari ini
                shape: BoxShape.circle,
              ),
              // Menghilangkan tulisan "2 weeks"
              outsideDaysVisible: false, // Menghilangkan hari-hari di luar bulan
            ),
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false, // Menghilangkan tombol format
              titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
