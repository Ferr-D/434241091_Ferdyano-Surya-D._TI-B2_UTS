import 'package:flutter/material.dart';
import 'detail_ticket.dart';

class TicketListScreen extends StatelessWidget {
  const TicketListScreen({super.key});

  // Data dummy tiket untuk tampilan awal
  List<Map<String, dynamic>> get _tickets => [
    {'id': 'TKT-001', 'title': 'Jaringan Wi-Fi Mati di Ruang Lab', 'status': 'Open', 'date': '2026-04-20'},
    {'id': 'TKT-002', 'title': 'Printer Tidak Bisa Print', 'status': 'In Progress', 'date': '2026-04-19'},
    {'id': 'TKT-003', 'title': 'Proyektor Error di Ruang Kelas', 'status': 'Closed', 'date': '2026-04-18'},
    {'id': 'TKT-004', 'title': 'Komputer Lab Lambat', 'status': 'Open', 'date': '2026-04-17'},
    {'id': 'TKT-005', 'title': 'Email Kampus Tidak Bisa Login', 'status': 'Closed', 'date': '2026-04-16'},
  ];

  Color _statusColor(String status) {
    switch (status) {
      case 'Open':
        return Colors.orange;
      case 'In Progress':
        return Colors.blue;
      case 'Closed':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Tiket'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: _tickets.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final ticket = _tickets[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: _statusColor(ticket['status']),
              child: Text(
                ticket['id'].toString().split('-').last,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            title: Text(
              ticket['title'],
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text('${ticket['id']} • ${ticket['date']}'),
            trailing: Chip(
              label: Text(
                ticket['status'],
                style: TextStyle(
                  color: _statusColor(ticket['status']),
                  fontSize: 12,
                ),
              ),
              side: BorderSide(color: _statusColor(ticket['status'])),
              backgroundColor: _statusColor(ticket['status']).withOpacity(0.1),
            ), 
            onTap: () {
              // Navigasi ke Detail Tiket (FR-005: Flow 3)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailTicketScreen(ticket: ticket),
                ),
              );
            },
          );
        },
      ),
      // FAB untuk membuat tiket baru
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_ticket');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
