import 'package:flutter/material.dart';
import 'presentation/login_screen.dart';
import 'presentation/dashboard.dart';
import 'presentation/list_ticket.dart';
import 'presentation/create_ticket.dart';
import 'presentation/profile_screen.dart';

// ValueNotifier global untuk mengontrol tema aplikasi
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const TicketingApp());
}

class TicketingApp extends StatelessWidget {
  const TicketingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp(
          title: 'E-Ticketing Helpdesk',
          debugShowCheckedModeBanner: false,
          // Light theme
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorSchemeSeed: Colors.blue,
          ),
          // Dark theme
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.blue,
          ),
          // ThemeMode dikontrol oleh themeNotifier
          themeMode: currentMode,
          // Halaman awal aplikasi (FR-001)
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginScreen(),
            '/dashboard': (context) => const Dashboard(),
            '/list_ticket': (context) => const TicketListScreen(),
            '/create_ticket': (context) => const CreateTicketScreen(),
            '/profile': (context) => const ProfileScreen(),
          },
        );
      },
    );
  }
}
