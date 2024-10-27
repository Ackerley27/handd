import 'package:flutter/material.dart';
import 'history_page_approver.dart';
import 'history_page_user.dart';
import 'history_page_staff.dart';
import 'dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Management',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(role: 'staff'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String role;

  const MyHomePage({super.key, required this.role});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  //กำหนด role เพื่อใช้ในการเปลี่ยนหน้า
  Widget _getHistoryPage() {
    switch (widget.role) {
      case 'approver':
        return const HistoryPageApprover();
      case 'staff':
        return const HistoryPageStaff();
      case 'user':
      default:
        return const HistoryPageUser();
    }
  }
//กำหนด role เพื่อใช้ในการเปลี่ยนหน้า

  List<Widget> get _pages => <Widget>[
        const DashboardPage(),
        _getHistoryPage(), // ใช้ฟังก์ชันเพื่อเลือกหน้า History ตาม role
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //แสดงหน้าที่เลือก
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
