// lib/pages/settings_page.dart

import 'package:flutter/material.dart';
import '../main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    showNotification(
        "Settings Page", "Anda sedang melihat pengaturan aplikasi");

    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.dark_mode, color: Colors.deepPurple),
            title: Text('Tema Gelap'),
            trailing: Switch(
              value: false, // Example state, implement state management here
              onChanged: (bool value) {
                // Toggle dark mode logic
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.orange),
            title: Text('Notifikasi'),
            trailing: Switch(
              value: true, // Example state
              onChanged: (bool value) {
                // Toggle notification logic
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language, color: Colors.green),
            title: Text('Bahasa'),
            trailing: DropdownButton<String>(
              value: 'Indonesia',
              onChanged: (String? newValue) {
                // Change language logic
              },
              items: <String>['Indonesia', 'English']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
