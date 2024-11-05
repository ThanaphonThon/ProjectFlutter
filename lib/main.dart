import 'package:flutter/material.dart';
import 'screens/personal_info_screen.dart';
import 'screens/NotificationScreen/notification_screen.dart';
import 'screens/TaskDetailScreen/approve_task_screen.dart';
import 'screens/human_resourse.dart'; // Import PersonalInfoScreen2 for navigation

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(), // Move the main screen to a separate widget
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to PersonalInfoScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PersonalInfoScreen(),
                  ),
                );
              },
              child: const Text("E-form",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            ),
            const SizedBox(height: 16), // Space between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to PersonalInfoScreen2
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PersonalInfoScreen2(),
                  ),
                );
              },
              child: const Text("Human Resource",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            ),
            const SizedBox(height: 16), // Space between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to PersonalInfoScreen2
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ),
                );
              },
              child: const Text("NotificationScreen",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            ),
            const SizedBox(height: 16), // Space between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to PersonalInfoScreen2
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ApproveTaskScreen(),
                  ),
                );
              },
              child: const Text("ApproveTaskScreen",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            ),
          ],
        ),
      ),
    );
  }
}
