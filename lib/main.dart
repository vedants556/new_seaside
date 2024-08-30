import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coastal_tourism_app/screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/register_screen.dart';
import 'services/notification_service.dart';
import 'screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coastal Tourism App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.teal,
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/notifications') {
          // Add logic for custom routes if required
          // Example: return MaterialPageRoute(builder: (context) => NotificationsScreen());
        }
        return null;
      },
    );
  }
}
