import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(HumanResourceApp());
}

class HumanResourceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HumanResourceScreen(),
    );
  }
}

class HumanResourceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), // รูปโปรไฟล์
            ),
            SizedBox(width: 10),
            Text(
              'Human Resource',
              style: TextStyle(fontSize: 20),
            ),
            Spacer(),
            Stack(
              children: [
                Icon(Icons.notifications, color: Colors.white),
                Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            HRButton(icon: Icons.cancel, label: 'Leave'),
            HRButton(icon: Icons.access_time, label: 'Time Attendance'),
            HRButton(icon: Icons.receipt_long, label: 'E-pay Slip'),
            HRButton(
              icon: Icons.home,
              label: 'Hope',
              onTap: () async {
                const url = 'https://portal.hi-group.com/sites/Portal/Pages/HopeLanding.aspx';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            HRButton(icon: Icons.assignment, label: 'Survey'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Personal'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'HR'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'E-Form'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class HRButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  HRButton({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.orange),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
