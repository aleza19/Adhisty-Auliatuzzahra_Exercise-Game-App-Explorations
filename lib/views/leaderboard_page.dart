import 'package:flutter/material.dart';

class LeaderBoardPage extends StatelessWidget {
  LeaderBoardPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> leaderboard = [
    {"name": "Jennifer", "points": 780, "rankChange": 3, "avatar": "assets/owl.jpg"},
    {"name": "William", "points": 756, "rankChange": -1, "avatar": "assets/frog.jpg"},
    {"name": "Samantha", "points": 698, "rankChange": -2, "avatar": "assets/dino.jpg"},
    {"name": "Emery", "points": 636, "rankChange": -1, "avatar": "assets/lion.jpg"},
    {"name": "Lydia", "points": 560, "rankChange": -1, "avatar": "assets/loopy1.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50, // Background color
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0,
        title: Text(
          'Leader Board',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black), // Black back arrow
      ),
      body: _buildLeaderboardBody(),
    );
  }

  Widget _buildLeaderboardBody() {
    return Column(
      children: [
        // Podium Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Podium Position 2 (Left)
              Align(
                alignment: Alignment.centerLeft,
                child: _buildPodiumColumn(
                  rank: 2,
                  avatar: 'assets/duck.jpg',
                  height: 100,
                  color: const Color.fromARGB(255, 255, 199, 191),
                ),
              ),
              // Podium Position 1 (Center)
              Align(
                alignment: Alignment.center,
                child: _buildPodiumColumn(
                  rank: 1,
                  avatar: 'assets/loopy2.jpg',
                  height: 140,
                  color: const Color.fromARGB(255, 255, 188, 233),
                ),
              ),
              // Podium Position 3 (Right)
              Align(
                alignment: Alignment.centerRight,
                child: _buildPodiumColumn(
                  rank: 3,
                  avatar: 'assets/cat2.jpg',
                  height: 80,
                  color: const Color.fromARGB(255, 186, 166, 235),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        // Leaderboard Items
        Expanded(
          child: ListView.builder(
            itemCount: leaderboard.length,
            itemBuilder: (context, index) {
              final item = leaderboard[index];
              return LeaderboardTile(
                name: item['name'],
                points: item['points'],
                rankChange: item['rankChange'],
                avatar: item['avatar'],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPodiumColumn({
    required int rank,
    required String avatar,
    required double height,
    required Color color,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(avatar), // Using the appropriate image
          backgroundColor: Colors.white,
        ),
        SizedBox(height: 8),
        Container(
          width: 80,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              '$rank',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LeaderboardTile extends StatelessWidget {
  final String name;
  final int points;
  final int rankChange;
  final String avatar;

  const LeaderboardTile({
    Key? key,
    required this.name,
    required this.points,
    required this.rankChange,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(avatar), // Using the provided avatar
                backgroundColor: Colors.transparent,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Text(
                '$points pts',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                rankChange > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                color: rankChange > 0 ? Colors.green : Colors.red,
                size: 18,
              ),
              Text(
                '${rankChange.abs()}',
                style: TextStyle(
                  fontSize: 16,
                  color: rankChange > 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
