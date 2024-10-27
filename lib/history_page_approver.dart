import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('History'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            // เพิ่มการทำงานสำหรับปุ่มกลับไปหน้าแรก
          },
        ),
      ),
      body: _buildHistoryContent(),
    );
  }

  Widget _buildHistoryContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header ของตาราง
          Container(
            color: Colors.teal,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Text('Book Picture',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))),
                Expanded(
                    child: Text('Book Name',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))),
                Expanded(
                    child: Text('Borrowed Date',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))),
                Expanded(
                    child: Text('Returned Date',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))),
                Expanded(
                    child: Text('Approver ID',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))),
                Expanded(
                    child: Text('Status',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
          // รายการหนังสือ
          Column(
            children: List.generate(10, (index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // รูปหนังสือ
                    Expanded(
                      child: Image.network(
                        'https://via.placeholder.com/50',
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),

                    // ชื่อหนังสือ
                    Expanded(
                      child: Text(
                        'Book $index',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16, // ปรับขนาดตัวอักษร
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Borrowed Date
                    Expanded(
                        child: Text(
                      '16/10/2024',
                      textAlign: TextAlign.center,
                    )),
                    // Returned Date
                    Expanded(
                        child: Text(
                      '25/10/2024',
                      textAlign: TextAlign.center,
                    )),
                    // Member ID
                    Expanded(
                        child: Text(
                      'M$index',
                      textAlign: TextAlign.center,
                    )),
                    // สถานะ
                    Expanded(
                      child: Icon(
                        index % 2 == 0 ? Icons.check_circle : Icons.cancel,
                        color: index % 2 == 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
