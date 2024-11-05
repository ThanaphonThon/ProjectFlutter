import 'package:flutter/material.dart';
import 'HumanResourse/survey_list_screen.dart'; // Import SurveyListScreen

class PersonalInfoScreen2 extends StatefulWidget {
  const PersonalInfoScreen2({super.key});

  @override
  _PersonalInfoScreen2State createState() => _PersonalInfoScreen2State();
}

class _PersonalInfoScreen2State extends State<PersonalInfoScreen2> {
  int _currentIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildMenuItem({
    required String title,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Human Resource",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined,
                        color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildMenuItem(
              title: 'Leave',
              icon: Icons.cancel,
              iconColor: Colors.deepOrange,
              onTap: () {},
            ),
            _buildMenuItem(
              title: 'Time Attendance',
              icon: Icons.access_time,
              iconColor: Colors.deepOrange,
              onTap: () {},
            ),
            _buildMenuItem(
              title: 'E-pay Slip',
              icon: Icons.receipt_long,
              iconColor: Colors.deepOrange,
              onTap: () {},
            ),
            _buildMenuItem(
              title: 'Hope',
              icon: Icons.local_hospital,
              iconColor: Colors.grey,
              onTap: () {},
            ),
            _buildMenuItem(
              title: 'Survey',
              icon: Icons.assignment,
              iconColor: Colors.grey,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurveyListScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Personal'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'HR'),
          BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: 'E-Form'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
        ],
      ),
    );
  }
}
