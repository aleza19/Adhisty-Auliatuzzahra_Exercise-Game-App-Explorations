// lib/models/user_model.dart

class UserModel {
  final String name;
  final String bio;
  final String gender;
  final DateTime dateOfBirth;
  final String phone;
  final String email;
  final int points;
  final int friends;

  UserModel({
    required this.name,
    required this.bio,
    required this.gender,
    required this.dateOfBirth,
    required this.phone,
    required this.email,
    required this.points,
    required this.friends,
  });

  UserModel copyWith({
    String? name,
    String? bio,
    String? gender,
    DateTime? dateOfBirth,
    String? phone,
    String? email,
    int? points,
    int? friends,
  }) {
    return UserModel(
      name: name ?? this.name,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      points: points ?? this.points,
      friends: friends ?? this.friends,
    );
  }
}
