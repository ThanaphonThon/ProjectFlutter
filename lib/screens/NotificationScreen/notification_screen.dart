import 'package:flutter/material.dart';
import 'approve_detail_screen.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  // Mock data for notifications
  final List<Map<String, String>> notifications = [
    {
      'title': 'รายการร้องขอเอกสาร',
      'type': 'Leave Online',
      'date': '23/09/2022',
      'time': '8:00 น.',
      'employeeName': 'Kongdech Puangkaew',
      'position': 'Manager',
      'requestDetail':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'reason': 'เพื่อใช้เป็นหลักฐานเอกสารประกอบสำหรับ',
      'additionalInfo': '- สถานะการรับ\v- อื่นๆ(Lorem ipsum dolor sit amet.)',
    },
    {
      'title': 'รายการร้องขอเอกสาร',
      'type': 'E-Pay Slip',
      'date': '22/09/2022',
      'time': '7:00 น.',
      'employeeName': 'Somsak Jirapat',
      'position': 'Accountant',
      'requestDetail':
          'Aliquam erat volutpat. Integer eu ligula at orci lacinia.',
      'reason': 'เพื่อใช้เป็นหลักฐานเอกสารประกอบสำหรับ',
      'additionalInfo': '-สถานะการรับ\v-ขั้นตอน(Aliquam erat volutpat.)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Notification", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ApproveDetailScreen(
                      title: notification['title'] ?? '',
                      date: notification['date'] ?? '',
                      time: notification['time'] ?? '',
                      type: notification['type'] ?? '',
                      employeeName: notification['employeeName'] ?? '',
                      position: notification['position'] ?? '',
                      requestDetail: notification['requestDetail'] ?? '',
                      reason: notification['reason'] ?? '',
                      additionalInfo: notification['additionalInfo'] ?? '',
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(notification['title'] ?? ''),
                  subtitle:
                      Text("${notification['date']}   ${notification['time']}"),
                  trailing: Text(
                    notification['type'] ?? '',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
