import 'package:flutter/material.dart';

void main() {
  runApp(SurveyApp());
}

class SurveyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SurveyScreen(),
    );
  }
}

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Survey"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Hi-Tech Apparel Co.,Ltd.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey),
            SizedBox(height: 10),
            Text(
              "เลือกภาษา",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  LanguageOption(
                    icon: Icons.volume_up,
                    label: "English",
                    value: "English",
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                    },
                  ),
                  LanguageOption(
                    icon: Icons.volume_up,
                    label: "ภาษาไทย",
                    value: "ภาษาไทย",
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                    },
                  ),
                  LanguageOption(
                    icon: Icons.volume_up,
                    label: "မြန်မာဘာသာ",
                    value: "မြန်မာဘာသာ",
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                    },
                  ),
                  LanguageOption(
                    icon: Icons.volume_up,
                    label: "ភាសាខ្មែរ",
                    value: "ភាសាខ្មែរ",
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                    },
                  ),
                  LanguageOption(
                    icon: Icons.volume_up,
                    label: "Việt Nam",
                    value: "Việt Nam",
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                    },
                  ),
                  LanguageOption(
                    icon: Icons.volume_up,
                    label: "ລາວ",
                    value: "ລາວ",
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // ฟังก์ชันเมื่อกดปุ่มยืนยัน
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text("ยืนยัน"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  LanguageOption({
    required this.icon,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        SizedBox(width: 10),
        Expanded(
          child: RadioListTile<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            title: Text(label),
          ),
        ),
      ],
    );
  }
}
