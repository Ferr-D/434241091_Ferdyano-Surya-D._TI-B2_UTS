import 'package:flutter/material.dart';
import '../main.dart'; // Import themeNotifier

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Pengguna')),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          const Center(child: CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50))),
          const SizedBox(height: 16),
          const Center(child: Text('User DIV Teknik Informatika', 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const Divider(height: 40),
          
          // Toggle Dark & Light Mode (UI Screen)
          SwitchListTile(
            title: const Text('Mode Gelap (Dark Mode)'),
            secondary: const Icon(Icons.dark_mode),
            value: themeNotifier.value == ThemeMode.dark,
            onChanged: (bool value) {
              themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
              setState(() {}); // Refresh tampilan switch
            },
          ),
          
          // Fitur Logout (FR-002)
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Keluar (Logout)', style: TextStyle(color: Colors.red)),
            onTap: () {
              // Navigasi kembali ke Login Screen dan hapus semua route sebelumnya
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}