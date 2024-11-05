import 'package:flutter/material.dart';
import 'task_detail_screen.dart';

class ApproveTaskScreen extends StatelessWidget {
  ApproveTaskScreen({super.key});

  // Mock data for tasks
  final List<Map<String, String>> tasks = [
    {
      'status': 'TODO',
      'type': 'Leave Online',
      'name': 'Kongdech Puangkaew',
      'position': 'UX/UI Design',
      'leaveType': 'ลาป่วย Full day',
      'dateRange': '23/11/2022 to 24/11/2022',
      'requestDate': '15/09/2022',
      'time': '10:30 น.',
      'profileImage':
          'https://via.placeholder.com/150', // Replace with actual image URL
    },
    {
      'status': 'TODO',
      'type': 'Leave Online',
      'name': 'Annette Black',
      'position': 'HRM',
      'leaveType': 'ลาป่วย Morning',
      'dateRange': '23/11/2022 8:00 to 12:00',
      'requestDate': '15/09/2022',
      'time': '10:30 น.',
      'profileImage':
          'https://via.placeholder.com/150', // Replace with actual image URL
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Approve Task", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Type Filter
            const Text(
              "Task Type",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                FilterChip(
                  label: const Text("All"),
                  selected: true,
                  onSelected: (bool value) {},
                  selectedColor: Colors.orange,
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text("Leave"),
                  selected: false,
                  onSelected: (bool value) {},
                  selectedColor: Colors.orange,
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Task List Title
            const Text(
              "Tasks List (6)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskDetailScreen(
                            name: task['name'] ?? '',
                            position: task['position'] ?? '',
                            leaveType: task['leaveType'] ?? '',
                            dateRange: task['dateRange'] ?? '',
                            requestDate: task['requestDate'] ?? '',
                            time: task['time'] ?? '',
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        // Main Task Card
                        Card(
                          elevation: 2,
                          margin: const EdgeInsets.only(
                              left: 24, top: 8, bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                    width: 32), // Space for the TODO label
                                // Profile Image
                                CircleAvatar(
                                  radius: 24,
                                  backgroundImage:
                                      NetworkImage(task['profileImage'] ?? ''),
                                ),
                                const SizedBox(width: 12),
                                // Task Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        task['type'] ?? '',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${task['name']} - ${task['position']}",
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "${task['leaveType']} ${task['dateRange']}",
                                        style: const TextStyle(
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                // Date and Time
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      task['requestDate'] ?? '',
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    Text(
                                      task['time'] ?? '',
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // TODO Label with Shadow Positioned to Match Card Height and Align Left
                        Positioned(
                          left: 0,
                          top: 8,
                          bottom: 8,
                          child: Material(
                            elevation: 2,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            child: Container(
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                              child: const Center(
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "TODO",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
