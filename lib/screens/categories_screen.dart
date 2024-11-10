import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});
}

class CategoriesScreen extends StatefulWidget {
  final List<Category> categories;

  const CategoriesScreen({super.key, required this.categories});

  @override
  CategoriesScreenState createState() => CategoriesScreenState();
}

class CategoriesScreenState extends State<CategoriesScreen> {
  List<String> categories = ['Coding', 'Design', 'Meeting'];  // Example list
  TextEditingController categoryController = TextEditingController();

  void _addCategory() {
    setState(() {
      categories.add(categoryController.text);
      categoryController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField for new category
            TextField(
              controller: categoryController,
              decoration: InputDecoration(
                labelText: 'New Category',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Add Category Button
            ElevatedButton(
              onPressed: _addCategory,
              child: Text('Add Category'),
            ),
            SizedBox(height: 20),
            // List of categories
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(categories[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          categories.removeAt(index);
                        });
                      },
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