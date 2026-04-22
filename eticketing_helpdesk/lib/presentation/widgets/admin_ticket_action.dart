import 'package:flutter/material.dart';

class AdminTicketActions extends StatelessWidget {
  const AdminTicketActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Manajemen Tiket (Admin)', 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          // Fitur Assign Tiket (FR-006: 4)
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Tugaskan (Assign) ke Teknisi'),
            onTap: () => Navigator.pop(context),
          ),
          // Fitur Update Status (FR-006: 3)
          ListTile(
            leading: const Icon(Icons.sync_alt),
            title: const Text('Ubah Status Tiket'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}