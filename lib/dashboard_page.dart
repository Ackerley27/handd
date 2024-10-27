import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Dashboard'),
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              // Handle sync action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          _buildCategorySelector(),
          const SizedBox(
              height: 40), // เพิ่มระยะห่างระหว่างปุ่ม All กับ Status Cards
          _buildStatusCards(),
        ],
      ),
    );
  }

  Widget _buildCategorySelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(4, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'All',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildStatusCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 1.5,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          _buildStatusCard('AVAILABLE', '8/20', Colors.teal),
          _buildStatusCard('BORROWED', '4/20', Colors.purpleAccent),
          _buildStatusCard('DISABLE', '5/20', Colors.redAccent),
          _buildStatusCard('PENDING', '3/20', Colors.orangeAccent),
        ],
      ),
    );
  }

  Widget _buildStatusCard(String status, String count, Color color) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            status,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            count,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
