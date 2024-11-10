import 'package:flutter/material.dart';
import 'package:myapp/screens/categories_screen.dart';
import 'package:myapp/screens/export_screen.dart';
import 'package:myapp/screens/logs_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Worktime Tracker'),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Time Tracker'),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.category,
              ),
              title: const Text('Categories'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.data_array,
              ),
              title: const Text('Logs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.import_export,
              ),
              title: const Text('Export'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExportScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Timer display
            Text(
              '00:00:00', // You'll replace this with the actual timer value
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            // Dropdown for category selection
            DropdownButtonFormField<String>(
              hint: Text('Select Work Category'),
              items: ['Coding', 'Design', 'Meeting'].map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (newValue) {
                // Handle category selection
              },
            ),
            SizedBox(height: 20),
            // Start/Pause/Stop Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Start work session
                  },
                  child: Text('Start'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Pause work session
                  },
                  child: Text('Pause'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Stop work session
                  },
                  child: Text('Stop'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Comments input box
            TextField(
              decoration: InputDecoration(
                labelText: 'Comments (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              onChanged: (text) {
                // Handle comments input
              },
            ),
          ],
        ),
      ),
    );
  }
}
