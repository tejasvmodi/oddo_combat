import 'package:flutter/material.dart';

class SchduleWidget extends StatelessWidget {
  final List<Map<String, String>> dummyData = [
    {'Day': 'Monday', 'Time': '9:00 AM', 'Area': 'Park'},
    {'Day': 'Wednesday', 'Time': '3:00 PM', 'Area': 'Beach'},
    {'Day': 'Friday', 'Time': '11:00 AM', 'Area': 'Forest'},
    
  ];

   SchduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule List'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: dummyData.length + 1, 
        itemBuilder: (context, index) {
          if (index == 0) {
            // Header row
            return Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                border: Border.all(color: Colors.black),
              ),
              child: const Row(
                children: [
                  Expanded(child: Center(child: Text('Day', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)))),
                  Expanded(child: Center(child: Text('Time', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)))),
                  Expanded(child: Center(child: Text('Area', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)))),
                ],
              ),
            );
          }
          final data = dummyData[index - 1]; 
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              children: [
                Expanded(child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data['Day'] ?? '', style: const TextStyle(fontSize: 16)),
                ))),
                Expanded(child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data['Time'] ?? '', style: const TextStyle(fontSize: 16)),
                ))),
                Expanded(child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data['Area'] ?? '', style: const TextStyle(fontSize: 16)),
                ))),
              ],
            ),
          );
        },
      ),
    );
  }
}