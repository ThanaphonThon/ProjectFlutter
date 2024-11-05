import 'package:flutter/material.dart';
import 'request_item.dart';

class RequestDetailScreen extends StatelessWidget {
  final RequestItem request;

  const RequestDetailScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile and Request Details Section in a Single Card
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Section
                    const Row(
                      children: [
                        // Profile Image
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            'https://example.com/profile.jpg',
                          ),
                        ),
                        SizedBox(width: 16),
                        // Name and Position
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ปริญญ์ กงทองลักษณ์',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text('ผู้อำนวยการฝ่ายทรัพยากร'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Request Details Section
                    const Text(
                      'Request Detail',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text('วันที่ร้องขอ: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('${request.date} ${request.time}'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'เพื่อใช้เป็นหลักฐานประกอบการกู้เงิน',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'สถานการณ์ปัจจุบัน\n- เงินกู้ (Lorem ipsum dolor sit amet, consectetur adipiscing)',
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'เพื่อประโยชน์การเงิน\nLorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Approval Section in a Separate Card
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Approval',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    // Approval Items with connecting lines
                    Column(
                      children: [
                        ApprovalItem(
                          name: 'Kongdech Puangkew',
                          status: 'Approve',
                          statusColor: Colors.green,
                          date: '21/09/2022',
                          time: '10:00 u.',
                          avatarUrl: 'https://example.com/avatar1.jpg',
                          isFirst: true,
                        ),
                        ApprovalItem(
                          name: 'Jane Cooper',
                          status: 'Wait Approve',
                          statusColor: Colors.blue,
                          avatarUrl: 'https://example.com/avatar2.jpg',
                          isMiddle: true,
                        ),
                        ApprovalItem(
                          name: 'Lemon Moper',
                          status: '-',
                          statusColor: Colors.grey,
                          avatarUrl: 'https://example.com/avatar3.jpg',
                          isLast: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ApprovalItem extends StatelessWidget {
  final String name;
  final String status;
  final Color statusColor;
  final String avatarUrl;
  final String? date;
  final String? time;
  final bool isFirst;
  final bool isMiddle;
  final bool isLast;

  const ApprovalItem({
    super.key,
    required this.name,
    required this.status,
    required this.statusColor,
    required this.avatarUrl,
    this.date,
    this.time,
    this.isFirst = false,
    this.isMiddle = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // เส้นเชื่อมและวงกลมสำหรับการอนุมัติ
        if (isFirst)
          Column(
            children: [
              Container(
                height: 40,
                width: 2,
                color: Colors.orange, // สีของเส้นเชื่อม
              ),
              const SizedBox(height: 5), // เว้นระยะห่าง
              const CircleAvatar(
                radius: 10,
                backgroundColor: Colors.orange, // สีของวงกลมสำหรับการอนุมัติ
              ),
            ],
          ),
        if (isMiddle)
          Column(
            children: [
              Container(
                height: 40,
                width: 2,
                color: Colors.grey, // สีของเส้นเชื่อม
              ),
              const SizedBox(height: 5), // เว้นระยะห่าง
              const CircleAvatar(
                radius: 10,
                backgroundColor: Colors.grey, // สีของวงกลมสำหรับรออนุมัติ
              ),
            ],
          ),
        if (isLast)
          Column(
            children: [
              Container(
                height: 40,
                width: 2,
                color: Colors.grey, // สีของเส้นเชื่อม
              ),
              const SizedBox(height: 5), // เว้นระยะห่าง
              const CircleAvatar(
                radius: 10,
                backgroundColor: Colors.grey, // สีของวงกลมสำหรับไม่ได้อนุมัติ
              ),
            ],
          ),

        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ชื่อ
              SizedBox(
                  height: 30,
                  child: Text(name,
                      style: const TextStyle(fontWeight: FontWeight.bold))),
              // เส้นเชื่อมและโปรไฟล์
              Row(
                children: [
                  // แสดงโปรไฟล์
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(avatarUrl), // โปรไฟล์
                  ),
                  const SizedBox(width: 8),
                  // แสดงสถานะ
                  Text(status, style: TextStyle(color: statusColor)),
                  if (date != null && time != null) ...[
                    const SizedBox(width: 8),
                    Text('$date $time',
                        style: TextStyle(color: Colors.grey[600])),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
