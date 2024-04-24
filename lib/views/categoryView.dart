// item_list_screen.dart
import 'package:flutter/material.dart';
import '../models/category.dart';

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final List<Item> _items = [];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Item List'),
        ),
        body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text('ID: ${item.id}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showEditDialog(context, item);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _items.remove(item);
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddDialog(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Item'),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(labelText: 'Item Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final itemName = _textEditingController.text.trim();
                if (itemName.isNotEmpty) {
                  setState(() {
                    _items.add(Item(id: _items.length + 1, name: itemName));
                    _textEditingController.clear();
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, Item item) {
    final TextEditingController _editTextEditingController =
        TextEditingController(text: item.name);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: _editTextEditingController,
            decoration: InputDecoration(labelText: 'New Item Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newName = _editTextEditingController.text.trim();
                if (newName.isNotEmpty) {
                  setState(() {
                    item.name = newName;
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
