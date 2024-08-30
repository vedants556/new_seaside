import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coastal_tourism_app/screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/register_screen.dart';
import 'services/notification_service.dart'; // Import the notification service

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init(); // Initialize the notification service
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
      // Define routes
      routes: {
        '/': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        // Handle navigation based on the notification payload
        if (settings.name == '/notifications') {
          // Add logic for custom routes if required
          // Example: return MaterialPageRoute(builder: (context) => NotificationsScreen());
        }
        return null; // Return null if no special handling is needed
      },
    );
  }
}
