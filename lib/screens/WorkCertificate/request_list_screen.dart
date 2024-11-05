import 'package:app_project/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_project/widgets/filter_dialog.dart';
import 'package:app_project/screens/WorkCertificate/request_item.dart';
import 'create_request_screen.dart';
import 'request_detail_screen.dart';

class WorkCertificateRequestListScreen extends StatefulWidget {
  const WorkCertificateRequestListScreen({super.key});

  @override
  _WorkCertificateRequestListScreenState createState() =>
      _WorkCertificateRequestListScreenState();
}

class _WorkCertificateRequestListScreenState
    extends State<WorkCertificateRequestListScreen> {
  final List<RequestItem> requests = [
    RequestItem(
        code: 'CODE-30202205',
        date: '23/09/2022',
        time: '8:00',
        status: RequestStatus.waiting),
    RequestItem(
        code: 'CODE-30202204',
        date: '23/09/2022',
        time: '8:00',
        status: RequestStatus.notApproved),
    RequestItem(
        code: 'CODE-30202203',
        date: '23/09/2022',
        time: '8:00',
        status: RequestStatus.approved),
    RequestItem(
        code: 'CODE-30202209',
        date: '23/09/2022',
        time: '8:00',
        status: RequestStatus.saveDraft),
  ];

  int _currentIndex = 3;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Request list',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.deepOrange),
                      onPressed: () {
                        // Implement refresh functionality
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.filter_list,
                          color: Colors.deepOrange),
                      onPressed: () async {
                        final result = await showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: '',
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return FadeTransition(
                              opacity: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(animation),
                              child: const FilterDialog(),
                            );
                          },
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return Transform.scale(
                              scale: animation.value,
                              child: child,
                            );
                          },
                        );

                        if (result != null) {
                          // ทำอะไรบางอย่างกับผลลัพธ์ที่ได้รับ
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: requests.length,
              itemBuilder: (context, index) {
                final request = requests[index];

                // Create a widget for the list item
                Widget listItem = RequestListItem(request: request);

                // If the status is waiting, wrap it in a GestureDetector
                if (request.status == RequestStatus.waiting) {
                  listItem = GestureDetector(
                    onTap: () {
                      // Navigate to the request detail screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RequestDetailScreen(request: request),
                        ),
                      );
                    },
                    child: listItem,
                  );
                }

                return request.status == RequestStatus.saveDraft
                    ? Dismissible(
                        key: Key(request.code),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            requests.removeAt(index);
                          });

                          // Show Snackbar notification that the item has been deleted
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${request.code} has been deleted"),
                            ),
                          );
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: listItem,
                      )
                    : listItem; // Return the list item directly if not a draft
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateRequestScreen(),
              ),
            );

            if (result != null) {
              // Handle the result
              // result will be a Map containing:
              // - type: selected option (financial, government, logistics, others)
              // - otherDetails: text from the details field if type is 'others'
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  // ฟังก์ชันสำหรับจัดการการกดของ BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // ต้องมีการเรียก setState หรือ Navigator เพื่อนำไปสู่หน้าที่เหมาะสม
  }
}

class RequestListItem extends StatelessWidget {
  final RequestItem request;

  const RequestListItem({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Row(
          children: [
            Icon(Icons.calendar_today, size: 16, color: Colors.orange[300]),
            const SizedBox(width: 8),
            Text(request.date),
            const SizedBox(width: 16),
            Icon(Icons.access_time, size: 16, color: Colors.orange[300]),
            const SizedBox(width: 8),
            Text(request.time),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              request.code,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 4),
            _buildStatusText(request.status),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusText(RequestStatus status) {
    Color color;
    String text;

    switch (status) {
      case RequestStatus.waiting:
        color = Colors.blue;
        text = 'Waiting Approve';
        break;
      case RequestStatus.approved:
        color = Colors.green;
        text = 'Approve';
        break;
      case RequestStatus.notApproved:
        color = Colors.red;
        text = 'Not Approve';
        break;
      case RequestStatus.saveDraft:
        color = Colors.grey;
        text = 'Save Draft';
        break;
    }

    return Text(
      text,
      style: TextStyle(color: color, fontWeight: FontWeight.w500),
    );
  }
}
