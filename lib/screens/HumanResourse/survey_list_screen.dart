import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SurveyListScreen(),
    );
  }
}

class SurveyListScreen extends StatelessWidget {
  SurveyListScreen({super.key});

  // Mock data for surveys
  final List<Map<String, String>> mockSurveys = [
    {
      'title': 'Survey FormName Untitled',
      'startDate': '20/08/2024',
      'endDate': '25/08/2024',
    },
    {
      'title': 'Survey FormName #1',
      'startDate': '20/08/2024',
      'endDate': '01/09/2024',
    },
    {
      'title': 'Survey FormName #2',
      'startDate': '30/08/2024',
      'endDate': '03/09/2024',
    },
    {
      'title': 'Survey FormName #3',
      'startDate': '05/09/2024',
      'endDate': '10/09/2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Survey", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back icon and other icons to white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Survey List",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.filter_list,
                    color: Colors.deepOrange,
                  ),
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

                    // Cast the result to Map<String, DateTime?> to avoid type error
                    if (result != null && result is Map<String, DateTime?>) {
                      DateTime? startDate = result['startDate'];
                      DateTime? endDate = result['endDate'];
                      print(
                          "Selected Date Range: ${startDate != null ? DateFormat("d MMM y").format(startDate) : 'N/A'} - ${endDate != null ? DateFormat("d MMM y").format(endDate) : 'N/A'}");
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: mockSurveys.length,
                itemBuilder: (context, index) {
                  final survey = mockSurveys[index];
                  return _buildSurveyItem(
                    title: survey['title'] ?? '',
                    startDate: survey['startDate'] ?? '',
                    endDate: survey['endDate'] ?? '',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSurveyItem({
    required String title,
    required String startDate,
    required String endDate,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.date_range, color: Colors.deepOrange),
                    const SizedBox(width: 4),
                    Text(startDate),
                  ],
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    const Icon(Icons.date_range, color: Colors.deepOrange),
                    const SizedBox(width: 4),
                    Text(endDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  DateTime? _startDate;
  DateTime? _endDate;
  final DateFormat _dateFormat = DateFormat("d MMM y");

  Future<void> _pickDate(BuildContext context, bool isStartDate) async {
    final initialDate =
        isStartDate ? _startDate ?? DateTime.now() : _endDate ?? DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
        } else {
          _endDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Period Date",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickDate(context, true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _startDate != null
                                ? _dateFormat.format(_startDate!)
                                : "Select Start Date",
                            style: const TextStyle(fontSize: 14),
                          ),
                          const Icon(Icons.calendar_today,
                              color: Colors.deepOrange, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text("ถึง", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickDate(context, false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _endDate != null
                                ? _dateFormat.format(_endDate!)
                                : "Select End Date",
                            style: const TextStyle(fontSize: 14),
                          ),
                          const Icon(Icons.calendar_today,
                              color: Colors.deepOrange, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop({
                    'startDate': _startDate,
                    'endDate': _endDate,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child:
                    const Text("Filter", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
