import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text('Detail ${widget.ticket['id']}')),
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
}