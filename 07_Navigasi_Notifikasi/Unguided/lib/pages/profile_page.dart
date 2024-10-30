// lib/pages/profile_page.dart

import 'package:flutter/material.dart';
import '../main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    showNotification("Profile Page", "Anda sedang melihat profil Anda");

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent[100],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle, size: 100, color: Colors.white),
              SizedBox(height: 10),
              Text(
                'Aji Prasetyo Nugroho',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                'ajiprast123@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
