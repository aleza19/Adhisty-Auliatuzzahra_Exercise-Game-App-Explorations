import '../models/leaderboard_model.dart';

class LeaderboardViewModel {
  List<LeaderboardModel> _leaderboard = [
    LeaderboardModel(name: 'Alex', points: 1000, rank: 1),
    LeaderboardModel(name: 'Emily', points: 780, rank: 2),
    LeaderboardModel(name: 'Sapphire', points: 756, rank: 3),
    LeaderboardModel(name: 'Alvaro', points: 698, rank: 4),
    LeaderboardModel(name: 'Maheswari', points: 636, rank: 5),
    LeaderboardModel(name: 'Zhafran', points: 560, rank: 6),
  ];

  List<LeaderboardModel> get leaderboard => _leaderboard;
}
