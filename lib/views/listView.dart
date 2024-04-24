// item_list_view_model.dart
import 'package:flutter/material.dart';
import '../models//category.dart';

class ItemListViewModel {
  final List<Item> _items = [];
  final TextEditingController _textEditingController = TextEditingController();

  List<Item> get items => _items;

  void addItem(String name) {
    _items.add(Item(id: _items.length + 1, name: name));
  }

  void deleteItem(Item item) {
    _items.remove(item);
  }

  void updateItem(Item item, String newName) {
    item.name = newName;
  }

  void showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Category'),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(labelText: 'Category Name'),
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
                  addItem(itemName);
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

  void showEditDialog(BuildContext context, Item item) {
    final TextEditingController _editTextEditingController =
        TextEditingController(text: item.name);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Category'),
          content: TextField(
            controller: _editTextEditingController,
            decoration: InputDecoration(labelText: 'New Category Name'),
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
                  updateItem(item, newName);
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
