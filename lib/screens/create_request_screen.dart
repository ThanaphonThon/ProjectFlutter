import 'package:flutter/material.dart';

class CreateRequestScreen extends StatefulWidget {
  const CreateRequestScreen({Key? key}) : super(key: key);

  @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  String? selectedOption;
  final TextEditingController _otherDetailsController = TextEditingController();

  final List<Map<String, String>> options = [
    {'title': 'สถาบันการเงิน/ Financial institution', 'value': 'financial'},
    {'title': 'หน่วยงานราชการ/ Government agencies', 'value': 'government'},
    {'title': 'ท่องเที่ยว/ Logistics', 'value': 'logistics'},
    {'title': 'อื่นๆ โปรดระบุ/ Others please specify', 'value': 'others'},
  ];

  @override
  void dispose() {
    _otherDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'เพื่อใช้ในการยื่นขอสมัครบัตรเครดิตกับสถาบันต่างๆ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...options.map((option) => _buildCheckboxTile(option)),
                  if (selectedOption == 'others') _buildOtherDetailsField(),
                  const SizedBox(height: 16),
                  const Text(
                    'เพื่อประโยชน์ในการ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildLargeTextField(),
                ],
              ),
            ),
          ),
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildLargeTextField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: TextField(
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        maxLines: 5,
      ),
    );
  }

  Widget _buildCheckboxTile(Map<String, String> option) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        option['title']!,
        style: const TextStyle(fontSize: 14),
      ),
      leading: SizedBox(
        width: 24,
        height: 24,
        child: Checkbox(
          value: selectedOption == option['value'],
          activeColor: Colors.deepOrange,
          onChanged: (bool? value) {
            setState(() {
              selectedOption = value! ? option['value'] : null;
            });
          },
        ),
      ),
    );
  }

  Widget _buildOtherDetailsField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 32.0),
      child: TextField(
        controller: _otherDetailsController,
        decoration: const InputDecoration(
          hintText: 'ระบุข้อความ', // เปลี่ยนที่นี่
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        maxLines: 3,
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Implement save functionality
                final data = {
                  'type': selectedOption,
                  'otherDetails': selectedOption == 'others'
                      ? _otherDetailsController.text
                      : null,
                };
                Navigator.pop(context, data);
              },
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
