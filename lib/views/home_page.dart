import 'package:flutter/material.dart';
import '../viewmodels/discover_view_model.dart';
import '../widgets/exercise_card.dart';
import 'activity_page.dart';
import 'leaderboard_page.dart';
import 'kategori_page.dart';
import 'calendar_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final DiscoverViewModel viewModel = DiscoverViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding kiri dan kanan
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25), // Jarak dari atas, bisa diatur sesuai keinginan

            // Header Discover
            Text(
              'Discover',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.getWelcomeMessage(),
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                                ],
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      value: 0.6,
                      color: Theme.of(context).primaryColor,
                      strokeWidth: 3,
                    ),
                  ),
                ],
              ),
            ),

            // Menu Icons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0), // Jarak atas-bawah dari ikon
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.apps, color: Theme.of(context).primaryColor),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const KategoriPage()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                    onPressed: () {
                      print("Navigating to Search");
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CalendarPage()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.leaderboard, color: Theme.of(context).primaryColor),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LeaderBoardPage()),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Exercises Section
            Text(
              'Exercise',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
            ),

            // Exercise Cards
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 16.0),
                children: [
                  ExerciseCard(
                    title: 'Angkat Beban',
                    description: 'Latihan angkat beban untuk meningkatkan kekuatan otot...',
                    number: '01',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActivityPage(title: 'Angkat Beban'),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  ExerciseCard(
                    title: 'Maraton',
                    description: 'Lari maraton untuk meningkatkan daya tahan dan kebugaran...',
                    number: '02',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActivityPage(title: 'Maraton'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
