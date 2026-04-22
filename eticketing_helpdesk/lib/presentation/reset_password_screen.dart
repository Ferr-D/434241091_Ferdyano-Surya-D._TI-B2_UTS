import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _usernameController = TextEditingController();

  void _handleResetPassword() {
    // Implementasi reset password logic (FR-004)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Link reset password telah dikirim.')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.lock_reset, size: 80, color: Colors.blue),
            const SizedBox(height: 24),
            const Text(
              'Lupa Password?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Masukkan username atau email Anda untuk mendapatkan tautan reset password.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Input Username / Email
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username atau Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 32),

            // Tombol Reset
            ElevatedButton(
              onPressed: _handleResetPassword,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Kirim Link Reset', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
