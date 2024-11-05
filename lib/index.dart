import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildDashboardPage(),
                _buildAnotherPage(),
              ],
            ),
          ),
          // Pagination Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSlideDot(_currentPage == 0), // Active dot for first page
              SizedBox(width: 8),
              _buildSlideDot(_currentPage == 1), // Active dot for second page
            ],
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildDashboardPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
              ),
Positioned(
  top: 50,
  left: 0,
  right: 0, // เพิ่ม left และ right เพื่อให้ครอบคลุมความกว้างทั้งหมด
  child: Center(
    child: Text(
      'Approve Task',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
              Positioned(
                top: 40,
                right: 16,
                child: Stack(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                    Positioned(
                      right: 0,
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
              ),
              Positioned(
                top: 50,
                right: 40,
                child: Icon(
                  Icons.cloud,
                  color: Colors.white.withOpacity(0.2),
                  size: 190,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.insert_chart, color: Colors.orange),
                      SizedBox(width: 4),
                      Text(
                        'Dash Board',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    height: 2,
                    width: 80,
                    color: Colors.orange,
                  ),
                ],
              ),
              SizedBox(width: 20),
              Row(
                children: [
                  Icon(Icons.list_alt, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    'Task List',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      '7 วันย้อนหลัง',
                      style: TextStyle(color: Colors.orange),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 300,
            color: Colors.white,
            child: StackedBarChart(),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatusIndicator("TODO", Colors.blue),
              _buildStatusIndicator("DOING", Colors.orange),
              _buildStatusIndicator("DONE", Colors.green),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: DonutChart(),
                ),
                Positioned(
                  top: 95,
                  right: 225,
                  child: Text(
                    '76 Task',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnotherPage() {
    return Center(
      child: Text("Another Page"),
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Personal'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'HR'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'E-Form'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xFF202020),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildStatusIndicator(String label, Color color) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 10),
        SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(width: 16),
      ],
    );
  }

  Widget _buildSlideDot(bool isActive) {
    return Container(
      width: 10,
      height: 50,
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class DonutChart extends StatelessWidget {
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SfCircularChart(
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
              DoughnutSeries<DonutChartData, String>(
                dataSource: [
                  DonutChartData('Leave Online', 50.0),
                  DonutChartData('รับรองบัตร', 20.0),
                  DonutChartData('เดินทาง', 15.0),
                  DonutChartData('ค่าซ่อม', 10.0),
                  DonutChartData('อื่นๆ', 5.0),
                ],
                pointColorMapper: (DonutChartData data, _) {
                  switch (data.category) {
                    case 'Leave Online':
                      return Color(0xFFE91E63);
                    case 'รับรองบัตร':
                      return Color(0xFFFF9800);
                    case 'เดินทาง':
                      return Color(0xFF8BC34A);
                    case 'ค่าซ่อม':
                      return Color(0xFFFFEB3B);
                    case 'อื่นๆ':
                      return Color(0xFFBDBDBD);
                    default:
                      return Colors.blue;
                  }
                },
                xValueMapper: (DonutChartData data, _) => data.category,
                yValueMapper: (DonutChartData data, _) => data.value,
                radius: '80%',
                innerRadius: '60%',
                animationDuration: 1000,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLegendItem('Leave Online', Color(0xFFE91E63), '50.00%'),
              _buildLegendItem('รับรองบัตร', Color(0xFFFF9800), '20.00%'),
              _buildLegendItem('เดินทาง', Color(0xFF8BC34A), '15.00%'),
              _buildLegendItem('ค่าซ่อม', Color(0xFFFFEB3B), '10.00%'),
              _buildLegendItem('อื่นๆ', Color(0xFFBDBDBD), '5.00%'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String title, Color color, String percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.circle, color: color, size: 10),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Text(
            percentage,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class DonutChartData {
  DonutChartData(this.category, this.value);
  final String category;
  final double value;
}

class StackedBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 25,
        interval: 5,
      ),
      series: <ChartSeries>[
        StackedColumnSeries<BarChartData, String>(
          dataSource: [
            BarChartData('Leave Online', 10, 5, 12),
            BarChartData('รับรองบัตร', 8, 6, 14),
            BarChartData('เดินทาง', 12, 7, 9),
            BarChartData('ค่าซ่อม', 15, 8, 6),
            BarChartData('อื่นๆ', 5, 3, 2),
          ],
          xValueMapper: (BarChartData data, _) => data.category,
          yValueMapper: (BarChartData data, _) => data.todo,
          name: 'TODO',
          color: Colors.blue,
        ),
        StackedColumnSeries<BarChartData, String>(
          dataSource: [
            BarChartData('Leave Online', 10, 5, 12),
            BarChartData('รับรองบัตร', 8, 6, 14),
            BarChartData('เดินทาง', 12, 7, 9),
            BarChartData('ค่าซ่อม', 15, 8, 6),
            BarChartData('อื่นๆ', 5, 3, 2),
          ],
          xValueMapper: (BarChartData data, _) => data.category,
          yValueMapper: (BarChartData data, _) => data.doing,
          name: 'DOING',
          color: Colors.orange,
        ),
        StackedColumnSeries<BarChartData, String>(
          dataSource: [
            BarChartData('Leave Online', 10, 5, 12),
            BarChartData('รับรองบัตร', 8, 6, 14),
            BarChartData('เดินทาง', 12, 7, 9),
            BarChartData('ค่าซ่อม', 15, 8, 6),
            BarChartData('อื่นๆ', 5, 3, 2),
          ],
          xValueMapper: (BarChartData data, _) => data.category,
          yValueMapper: (BarChartData data, _) => data.done,
          name: 'DONE',
          color: Colors.green,
        ),
      ],
    );
  }
}

class BarChartData {
  BarChartData(this.category, this.todo, this.doing, this.done);
  final String category;
  final int todo;
  final int doing;
  final int done;
}
