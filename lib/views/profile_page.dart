import 'package:flutter/material.dart';
import '../viewmodels/profile_view_model.dart';
import '../pages/change_email_password_page.dart';
import '../pages/profile_settings_page.dart';
import '../pages/subscription_page.dart'; // Import SubscriptionPage

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileViewModel viewModel = ProfileViewModel();

  // Function to navigate to Subscription page
  void _navigateToSubscriptionPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SubscriptionPage()),
    );
  }

  // Function to navigate to Profile Settings page
  void _navigateToProfileSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileSettingsPage(viewModel: viewModel),
      ),
    );
  }

  // Function to navigate to Change Email & Password page
  void _navigateToChangeEmailPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeEmailPasswordPage(viewModel: viewModel),
      ),
    );
  }

  // Function for logout confirmation
  void _onLogoutTap() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi Keluar"),
          content: Text("Apakah Anda yakin ingin keluar?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text("Keluar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = viewModel.user;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"), // Title of the AppBar
        backgroundColor: Colors.green.shade100, // AppBar color
        elevation: 0, // Remove shadow
        centerTitle: true, // Center the title
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header profile
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.transparent, // Remove the background color to blend with page
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green.shade100, // Make background green for contrast
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  Text(
                    '${user.points} Poin | ${user.friends} Teman',
                    style: TextStyle(color: Theme.of(context).primaryColorDark),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Space before the options section
            // Options Section Container
            Expanded(
              child: Card(
                color: Colors.green.shade50, // Match the card color to background
                elevation: 0, // Remove shadow for a flat look
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListView(
                  children: [
                    // Menu pengaturan profil
                    ListTile(
                      leading: Icon(Icons.settings, color: Theme.of(context).iconTheme.color),
                      title: Text(
                        'Pengaturan Profil',
                        style: TextStyle(color: Theme.of(context).primaryColorDark),
                      ),
                      onTap: _navigateToProfileSettings,
                    ),
                    // Menu ubah email & password
                    ListTile(
                      leading: Icon(Icons.email, color: Theme.of(context).iconTheme.color),
                      title: Text(
                        'Ubah Email & Password',
                        style: TextStyle(color: Theme.of(context).primaryColorDark),
                      ),
                      onTap: _navigateToChangeEmailPassword,
                    ),
                    // Menu subscription
                    ListTile(
                      leading: Icon(Icons.subscriptions, color: Theme.of(context).iconTheme.color),
                      title: Text(
                        'Subscription',
                        style: TextStyle(color: Theme.of(context).primaryColorDark),
                      ),
                      onTap: _navigateToSubscriptionPage,
                    ),
                    // Menu logout
                    ListTile(
                      leading: Icon(Icons.logout, color: Theme.of(context).iconTheme.color),
                      title: Text(
                        'Keluar',
                        style: TextStyle(color: Theme.of(context).primaryColorDark),
                      ),
                      onTap: _onLogoutTap,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
