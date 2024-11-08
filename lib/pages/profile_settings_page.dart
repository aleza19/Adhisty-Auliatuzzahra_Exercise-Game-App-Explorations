import 'package:flutter/material.dart';
import '../viewmodels/profile_view_model.dart';

class ProfileSettingsPage extends StatefulWidget {
  final ProfileViewModel viewModel;

  const ProfileSettingsPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  late String name;
  late String bio;
  late String phone;

  @override
  void initState() {
    super.initState();
    name = widget.viewModel.user.name;
    bio = widget.viewModel.user.bio;
    phone = widget.viewModel.user.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengaturan Profil", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green, // Dark green background
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white), // White icons
      ),
      backgroundColor: Colors.green.shade50, // Light green background for the body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Nama"),
            _buildTextField("Nama", name, (value) => name = value),
            SizedBox(height: 20),
            _buildLabel("Bio"),
            _buildTextField("Bio", bio, (value) => bio = value),
            SizedBox(height: 20),
            _buildLabel("Nomor HP"),
            _buildTextField("Nomor HP", phone, (value) => phone = value, keyboardType: TextInputType.phone),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  widget.viewModel.updateProfile(name: name, bio: bio, phone: phone);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Profil berhasil diperbarui.")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Button color matches the AppBar
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: Text("Simpan", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold, fontSize: 16), // Dark green label color
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue, Function(String) onChanged, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.green[800]!, width: 1.5), // Dark green focus border
        ),
      ),
      controller: TextEditingController(text: initialValue),
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}
