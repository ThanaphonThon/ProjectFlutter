import 'package:app_project/screens/request_list_screen.dart';
import 'package:flutter/material.dart';

class RequestDetailScreen extends StatefulWidget {
  final RequestItem request; // เพิ่มการเก็บค่าของ request

  const RequestDetailScreen({Key? key, required this.request})
      : super(key: key);

  @override
  State<RequestDetailScreen> createState() => _RequestDetailScreenState();
}

class _RequestDetailScreenState extends State<RequestDetailScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final Map<String, dynamic> jsonData = {
    'profile': {
      'name': 'ปรัชญ์ กงทองลักษณ์',
      'position': 'ผู้อำนวยการฝ่ายสรรหาบุคลากร',
      'date': '23/04/2024 16:53:35',
    },
    'request': {
      'purpose': [
        'สถาบันการเงิน',
        'อื่นๆ (Lorem ipsum dolor sit amet, consectetur adipiscing)',
      ],
      'benefit':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.consectetur adipiscing elit.',
    },
    'approvals': [
      {
        'name': 'Kongdech Puangkaew',
        'status': 'Approve',
        'date': '21/09/2022 10:00',
        'color': 'green'
      },
      {
        'name': 'Jane Cooper',
        'status': 'Wait Approve',
        'date': '-',
        'color': 'orange'
      },
      {'name': 'Lemon Moper', 'status': '-', 'date': '-', 'color': 'grey'},
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'ใบรับรองเงินเดือน',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(),
            const SizedBox(height: 16),
            _buildRequestDetailSection(),
            const SizedBox(height: 16),
            _buildApprovalSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            'https://www.fakepersongenerator.com/Face/female/female20171026324958514.jpg',
          ),
        ),
        const SizedBox(height: 16),
        Text(
          jsonData['profile']['name'],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          jsonData['profile']['position'],
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          jsonData['profile']['date'],
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildRequestDetailSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'เพื่อใช้เป็นหลักฐานเอกสารประกอบสำหรับ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...jsonData['request']['purpose'].map<Widget>((item) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
            child: Text(
              '• $item',
              style: const TextStyle(fontSize: 14),
            ),
          );
        }).toList(),
        const SizedBox(height: 16),
        const Text(
          'เพื่อประโยชน์ในการ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          jsonData['request']['benefit'],
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildApprovalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Approval',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...jsonData['approvals'].map<Widget>((approval) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://www.fakepersongenerator.com/Face/male/male1085154941819.jpg',
              ),
            ),
            title: Text(approval['name']),
            subtitle: Text(approval['date']),
            trailing: Text(
              approval['status'],
              style: TextStyle(
                color: _getColor(approval['color']),
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Color _getColor(String colorString) {
    switch (colorString) {
      case 'green':
        return Colors.green;
      case 'orange':
        return Colors.orange;
      case 'grey':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }
}
