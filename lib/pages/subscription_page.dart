// lib/pages/subscription_page.dart

import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildFriendTile("cremeboba"),
          _buildFriendTile("sweetlycandy"),
          _buildFriendTile("etheareal"),
          _buildFriendTile("urfavoritenight"),
          _buildFriendTile("flowerbby"),
          _buildFriendTile("lovelyrain"),
          _buildFriendTile("Aeskyhigh"),
          _buildFriendTile("Therow"),
          _buildFriendTile("Snowflakes"),
          _buildFriendTile("ShyDoll"),
          _buildFriendTile("hadiahchiki"),
          _buildFriendTile("RoseLife"),
        ],
      ),
    );
  }

  Widget _buildFriendTile(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.green.shade100,
            child: Text(
              name[0].toUpperCase(),
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade100,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              "Ikuti",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
