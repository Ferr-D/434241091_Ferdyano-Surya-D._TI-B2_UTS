import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Statistik Tiket',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Ringkasan Tiket (FR-008)
            Row(
              children: [
                _buildStatCard('Total Tiket', '24', Colors.blue),
                _buildStatCard('Aktif', '5', Colors.orange),
                _buildStatCard('Selesai', '19', Colors.green),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              'Menu Utama',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Navigasi Menu berdasarkan FR-005 & FR-006
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.add)),
              title: const Text('Buat Tiket Baru'),
              subtitle: const Text('Laporkan kendala IT Anda'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, '/create_ticket');
              },
            ),
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.list_alt)),
              title: const Text('Daftar Tiket'),
              subtitle: const Text('Lihat status dan riwayat tiket'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, '/list_ticket');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget pendukung untuk menampilkan ringkasan data (FR-008)
  Widget _buildStatCard(String title, String count, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(title, style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 8),
              Text(
                count,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
