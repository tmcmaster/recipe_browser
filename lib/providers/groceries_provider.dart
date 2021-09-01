import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_browser/models/grocery_item.dart';
import 'package:recipe_browser/repositories/groceries_repository.dart';
import 'package:uuid/uuid.dart';

final groceryItemFamily = Provider.family<GroceryItem, int>((ref, index) => ref.watch(groceryItemsProvider)[index]);

final groceryItemsProvider = StateNotifierProvider<GroceryListNotifier, List<GroceryItem>>(
  (_) => GroceryListNotifier(
    repository: GroceriesRepository(),
  ),
);

class GroceryListNotifier extends StateNotifier<List<GroceryItem>> {
  static final _uuid = Uuid();
  late final GroceriesRepository _repository;

  GroceryListNotifier({
    required GroceriesRepository repository,
  }) : super([]) {
    _repository = repository;
    _repository.load().then((groceries) => state = groceries);
  }

  void add(String title) {
    final newItem = GroceryItem(
      id: _uuid.v4(),
      title: title,
      quantity: '',
      category: '',
      done: false,
    );
    state = [...state, newItem];
    _repository.save(state);
  }

  void move(oldIndex, newIndex) {
    final list = [...state];
    int index = (oldIndex < newIndex ? newIndex - 1 : newIndex);
    final item = list.removeAt(oldIndex);
    list.insert(index, item);
    state = list;
    _repository.save(state);
  }

  void remove(GroceryItem itemToRemove) {
    state = state.where((item) => item != itemToRemove).toList();
    _repository.save(state);
  }

  void title(GroceryItem selectedItem, newTitle) {
    state = state.map((item) => (item == selectedItem ? item.copyWith(title: newTitle) : item)).toList();
    _repository.save(state);
  }

  void done(GroceryItem selectedItem, doneValue) {
    state = state.map((item) => (item == selectedItem ? item.copyWith(done: doneValue) : item)).toList();
    _repository.save(state);
  }
}
