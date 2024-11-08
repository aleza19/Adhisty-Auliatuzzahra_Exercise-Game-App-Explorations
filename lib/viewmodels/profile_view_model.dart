import '../models/user_model.dart';

class ProfileViewModel {
  UserModel _user = UserModel(
    name: 'Adhis',
    bio: 'Fitness enthusiast',
    gender: 'Laki-laki',
    dateOfBirth: DateTime(1995, 5, 20),
    phone: '08123456789',
    email: 'adhis@example.com',
    points: 4560,
    friends: 300,
  );

  UserModel get user => _user;

  void increaseFriends() {
    _user = _user.copyWith(friends: _user.friends + 1);
  }

  bool changeEmail(String oldEmail, String newEmail) {
    if (oldEmail == _user.email) {
      _user = _user.copyWith(email: newEmail);
      return true;
    }
    return false;
  }

  bool changePassword(String oldPassword, String newPassword) {
    // Untuk contoh ini, kita asumsikan password saat ini adalah 'password123'
    const currentPassword = 'password123';
    if (oldPassword == currentPassword) {
      // Simpan password baru sesuai kebutuhan (misalnya, di backend)
      // Di sini kita hanya mengembalikan true untuk simulasi
      return true;
    }
    return false;
  }

  void updateProfile({
    String? name,
    String? bio,
    String? gender,
    DateTime? dateOfBirth,
    String? phone,
  }) {
    _user = _user.copyWith(
      name: name,
      bio: bio,
      gender: gender,
      dateOfBirth: dateOfBirth,
      phone: phone,
    );
  }
}
