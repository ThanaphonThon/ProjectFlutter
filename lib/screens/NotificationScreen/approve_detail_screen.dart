import 'package:flutter/material.dart';

class ApproveDetailScreen extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String type;
  final String employeeName;
  final String position;
  final String requestDetail;
  final String reason;
  final String additionalInfo;

  const ApproveDetailScreen({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.type,
    required this.employeeName,
    required this.position,
    required this.requestDetail,
    required this.reason,
    required this.additionalInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Approve Detail", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150', // Replace with actual image URL
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employeeName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      position,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Request Detail",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  "วันที่ร้องขอ:",
                  style: TextStyle(color: Colors.orange),
                ),
                const SizedBox(width: 8), // Space between label and date/time
                Text(
                  "$date, $time",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  "หมายเหตุ",
                  style: TextStyle(color: Colors.orange),
                ),
                const SizedBox(width: 8),
                Text(
                  requestDetail,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              reason,
              style: const TextStyle(color: Colors.orange),
            ),
            Text(
              additionalInfo,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text(
              "หมายเหตุ",
              style: TextStyle(color: Colors.orange),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "กรอกหมายเหตุ",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Approve",
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Not Approve",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Reject",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
