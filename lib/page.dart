import 'package:flutter/material.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
    );
  }
}

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ส่วนหัวแบบกำหนดเอง
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'), // รูปโปรไฟล์ผู้ใช้
                  radius: 20,
                ),
                SizedBox(width: 10),
                Text(
                  'Approve Task',
                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Stack(
                  children: [
                    Icon(Icons.notifications, color: Colors.white, size: 28),
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
          // ส่วน TabBar และตัวกรองประเภทงาน
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.list, size: 24),
                    SizedBox(width: 8),
                    Text(
                      "Task List",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(Icons.tune, color: Colors.orange),
                  ],
                ),
                SizedBox(height: 10),
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tabs: [
                    Tab(text: 'All'),
                    Tab(text: 'Leave'),
                    Tab(text: 'ลืมรูดบัตร'),
                    Tab(text: 'เดินทาง/เบี้ยเลี้ยง'),
                  ],
                ),
              ],
            ),
          ),
          // ส่วนแสดงรายการงาน
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                TaskCard(
                  title: 'Leave Online',
                  name: 'Kongdech Puangkaew',
                  position: 'UX/UI Design',
                  status: 'TODO',
                  dateRange: '16/09/2022 - 19/09/2022',
                  date: '15/09/2022 10:30',
                  amount: '3',
                  profileImage: 'https://via.placeholder.com/150',
                ),
                TaskCard(
                  title: 'Salary Certificate',
                  name: 'Annette Black',
                  position: 'HRM',
                  status: 'DONE',
                  dateRange: '15/09/2022',
                  date: '15/09/2022 10:30',
                  amount: '1',
                  profileImage: 'https://via.placeholder.com/150',
                ),
                TaskCard(
                  title: 'Salary Certificate',
                  name: 'Annette Black',
                  position: 'HRM',
                  status: 'TODO',
                  dateRange: '15/09/2022',
                  date: '15/09/2022 10:30',
                  amount: '1',
                  profileImage: 'https://via.placeholder.com/150',
                ),
                TaskCard(
                  title: 'Salary Certificate',
                  name: 'Annette Black',
                  position: 'HRM',
                  status: 'DONE',
                  dateRange: '15/09/2022',
                  date: '15/09/2022 10:30',
                  amount: '1',
                  profileImage: 'https://via.placeholder.com/150',
                ),
                TaskCard(
                  title: 'Salary Certificate',
                  name: 'Annette Black',
                  position: 'HRM',
                  status: 'TODO',
                  dateRange: '15/09/2022',
                  date: '15/09/2022 10:30',
                  amount: '1',
                  profileImage: 'https://via.placeholder.com/150',
                ),
                TaskCard(
                  title: 'Salary Certificate',
                  name: 'Annette Black',
                  position: 'HRM',
                  status: 'DONE',
                  dateRange: '15/09/2022',
                  date: '15/09/2022 10:30',
                  amount: '1',
                  profileImage: 'https://via.placeholder.com/150',
                ),
                TaskCard(
                  title: 'Salary Certificate',
                  name: 'Annette Black',
                  position: 'HRM',
                  status: 'TODO',
                  dateRange: '15/09/2022',
                  date: '15/09/2022 10:30',
                  amount: '1',
                  profileImage: 'https://via.placeholder.com/150',
                ),
              ],
            ),
          ),
        ],
      ),
bottomNavigationBar: ClipRRect(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(30), // ทำให้มุมด้านบนซ้ายโค้ง
    bottomRight: Radius.circular(30), // ทำให้มุมด้านบนขวาโค้ง
  ),
  child: BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Personal'),
      BottomNavigationBarItem(icon: Icon(Icons.business), label: 'HR'),
      BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'E-Form'),
      BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
    ],
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.grey,
    backgroundColor: Color(0xFF202020), // สีพื้นหลังของ BottomNavigationBar
    type: BottomNavigationBarType.fixed, // คงตำแหน่งของไอคอนไว้
  ),
),

    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String name;
  final String position;
  final String status;
  final String dateRange;
  final String date;
  final String amount;
  final String profileImage;

  TaskCard({
    required this.title,
    required this.name,
    required this.position,
    required this.status,
    required this.dateRange,
    required this.date,
    required this.amount,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // แถบสถานะแนวตั้ง
          Container(
            width: 40,
            height: 100,
            decoration: BoxDecoration(
              color: status == 'TODO' ? Colors.blue : Colors.orange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  status,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // เนื้อหาของการ์ด
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(profileImage),
                    radius: 24,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Spacer(),
                            Icon(Icons.calendar_today, size: 16, color: Colors.orange),
                            SizedBox(width: 4),
                            Text(dateRange, style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(name, style: TextStyle(fontSize: 14)),
                        Text(position, style: TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(date, style: TextStyle(fontSize: 12)),
                            Spacer(),
                            Text('Amount: ', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            Text(amount, style: TextStyle(fontSize: 12, color: Colors.orange, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
