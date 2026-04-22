import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy notifikasi (FR-007)
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Tiket TKT-001 Diperbarui',
        'message': 'Status tiket Anda diubah menjadi "In Progress".',
        'time': '10 Menit yang lalu',
        'isRead': false,
        'ticketId': 'TKT-001',
      },
      {
        'title': 'Balasan Baru di TKT-002',
        'message': 'Admin telah membalas tiket keluhan Anda.',
        'time': '1 Jam yang lalu',
        'isRead': true,
        'ticketId': 'TKT-002',
      },
      {
        'title': 'Tiket TKT-003 Selesai',
        'message': 'Keluhan Anda telah diselesaikan oleh tim Helpdesk.',
        'time': 'Kemarin',
        'isRead': true,
        'ticketId': 'TKT-003',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return ListTile(
            tileColor: notif['isRead'] ? null : Colors.blue.withOpacity(0.05),
            leading: CircleAvatar(
              backgroundColor: notif['isRead'] ? Colors.grey : Colors.blue,
              child: const Icon(Icons.notifications, color: Colors.white),
            ),
            title: Text(
              notif['title'],
              style: TextStyle(
                fontWeight: notif['isRead'] ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(notif['message']),
                const SizedBox(height: 4),
                Text(
                  notif['time'],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            onTap: () {
              // Navigasi ke halaman terkait (FR-007: Flow 2)
              // Untuk prototype, kita gunakan dummy route
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Membuka detail tiket ${notif['ticketId']}')),
              );
            },
          );
        },
      ),
    );
  }
}
