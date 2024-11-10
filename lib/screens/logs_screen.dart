import 'package:flutter/material.dart';

class LogsScreen extends StatelessWidget {
  final List<Map<String, String>> logs = [
    {
      'category': 'Coding',
      'start': '10:00 AM',
      'end': '12:00 PM',
      'comments': 'Implemented user login',
    },
    {
      'category': 'Meeting',
      'start': '01:00 PM',
      'end': '02:00 PM',
      'comments': 'Team meeting to discuss project progress',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Logs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown to filter logs by category
            DropdownButtonFormField<String>(
              hint: Text('Filter by Category'),
              items: ['All', 'Coding', 'Meeting'].map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (newValue) {
                // Handle filter change
              },
            ),
            SizedBox(height: 20),
            // List of work session logs
            Expanded(
              child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  final log = logs[index];
                  return Card(
                    child: ListTile(
                      title: Text('${log['category']}'),
                      subtitle: Text(
                        'Start: ${log['start']}\nEnd: ${log['end']}\nComments: ${log['comments']}',
                      ),
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