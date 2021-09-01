import 'dart:async';
import 'dart:convert';

import 'package:recipe_browser/models/grocery_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// TODO: This should really handle the delay to get the SharedPreferences in a better way.
/// Not doing this better for the time being, for we just want to get some screens built for now.
class GroceriesRepository {
  static const KEY = 'groceries';

  static final _uuid = Uuid();

  GroceriesRepository() {
    SharedPreferences.getInstance().then((pref) {
      print('SharedPreferences are ready.');
      _init();
    });
  }

  void _init() {
    /// TODO: need to remove this, for it is only here for testing.
    load().then((list) {
      print('Current groceries list: $list');
      if (list.isEmpty) {
        print('---- Adding some test groceries.');
        save([
          GroceryItem(
            id: _uuid.v4(),
            title: 'Test adding and removing groceries.',
            quantity: 'a bit',
            category: 'testing',
            done: false,
          ),
        ]);
      }
    });
  }

  Future<bool> save(List<GroceryItem> groceries) {
    final completed = Completer<bool>();
    SharedPreferences.getInstance().then((pref) {
      final groceryStrings = groceries.map((groceryItem) => jsonEncode(groceryItem.toJson())).toList();
      pref.setStringList(KEY, groceryStrings);
      completed.complete(true);
    });
    return completed.future;
  }

  Future<List<GroceryItem>> load() {
    final completed = Completer<List<GroceryItem>>();
    SharedPreferences.getInstance().then((pref) {
      final groceryStrings = pref.getStringList(KEY);
      if (groceryStrings != null) {
        final groceries = groceryStrings.map((groceryItemString) {
          Map<String, dynamic> map = jsonDecode(groceryItemString);
          if (map['id'] == null) {
            map['id'] = _uuid.v4();
          }
          return GroceryItem.fromJson(map);
        }).toList();
        completed.complete(groceries);
      } else {
        completed.complete([]);
      }
    });
    return completed.future;
  }
}
