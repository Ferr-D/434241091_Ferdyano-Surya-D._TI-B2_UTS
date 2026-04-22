import 'package:flutter/material.dart';
import 'widgets/admin_ticket_action.dart';

class DetailTicketScreen extends StatefulWidget {
  final Map<String, dynamic> ticket;
  const DetailTicketScreen({super.key, required this.ticket});

  @override
  State<DetailTicketScreen> createState() => _DetailTicketScreenState();
}

class _DetailTicketScreenState extends State<DetailTicketScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${widget.ticket['id']}'),
        actions: [
          // Tombol khusus Admin (FR-006)
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            tooltip: 'Tindakan Admin',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const AdminTicketActions(),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Text(widget.ticket['title'], 
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Chip(label: Text(widget.ticket['status'])),
                const Divider(height: 32),
                const Text('Deskripsi Keluhan:', style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('Masalah jaringan di ruang praktikum lantai 2.'),
                const SizedBox(height: 24),

                // FR-010 & FR-011: Riwayat & Tracking Tiket
                const Text('Riwayat & Tracking Tiket:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildTrackingItem(Icons.check_circle, 'Tiket Selesai', '22 Apr 2026 14:00', Colors.grey),
                _buildTrackingItem(Icons.sync, 'Diproses oleh Teknisi (Budi)', '21 Apr 2026 09:30', Colors.blue),
                _buildTrackingItem(Icons.assignment, 'Tiket Dibuat', '20 Apr 2026 08:15', Colors.green),

                const SizedBox(height: 24),
                const Text('Komentar & Balasan:', style: TextStyle(fontWeight: FontWeight.bold)),
                // Contoh tampilan reply/komentar (FR-005: 5)
                const ListTile(
                  leading: CircleAvatar(child: Icon(Icons.support_agent)),
                  title: Text('Helpdesk (Admin)'),
                  subtitle: Text('Teknisi sedang mengecek router di lokasi Anda.'),
                ),
              ],
            ),
          ),
          // Input untuk memberikan komentar/reply (FR-005: 5)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      hintText: 'Tulis balasan...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    // Logic kirim komentar
                    _commentController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget bantuan untuk menampilkan item tracking (FR-010 & FR-011)
  Widget _buildTrackingItem(IconData icon, String title, String time, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}