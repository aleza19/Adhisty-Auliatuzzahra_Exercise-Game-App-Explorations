import 'package:flutter/material.dart';
import '../viewmodels/profile_view_model.dart';

class ChangeEmailPasswordPage extends StatefulWidget {
  final ProfileViewModel viewModel;

  const ChangeEmailPasswordPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  _ChangeEmailPasswordPageState createState() => _ChangeEmailPasswordPageState();
}

class _ChangeEmailPasswordPageState extends State<ChangeEmailPasswordPage> {
  late String oldEmail;
  late String newEmail;
  late String oldPassword;
  late String newPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Email & Password", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green, // Dark green background
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white), // White icon color
      ),
      backgroundColor: Colors.green.shade50, // Light green background for the body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Email Lama"),
            _buildTextField("Email Lama", (value) => oldEmail = value),
            SizedBox(height: 20),
            _buildLabel("Email Baru"),
            _buildTextField("Email Baru", (value) => newEmail = value),
            SizedBox(height: 20),
            _buildLabel("Password Lama"),
            _buildTextField("Password Lama", (value) => oldPassword = value, obscureText: true),
            SizedBox(height: 20),
            _buildLabel("Password Baru"),
            _buildTextField("Password Baru", (value) => newPassword = value, obscureText: true),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  bool emailUpdated = widget.viewModel.changeEmail(oldEmail, newEmail);
                  bool passwordUpdated = widget.viewModel.changePassword(oldPassword, newPassword);
                  if (emailUpdated && passwordUpdated) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Email dan password berhasil diubah.")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Email lama atau password lama tidak sesuai.")),
                    );
                  }
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

  Widget _buildTextField(String label, Function(String) onChanged, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
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
      onChanged: onChanged,
      style: TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}
