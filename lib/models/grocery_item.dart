import 'package:freezed_annotation/freezed_annotation.dart';

part 'grocery_item.freezed.dart';
part 'grocery_item.g.dart';

@freezed
class GroceryItem with _$GroceryItem {
  factory GroceryItem({
    required String id,
    required String title,
    required String quantity,
    required String category,
    required bool done,
  }) = _GroceryItem;

  // factory GroceryItem.title(String title) {
  //   return GroceryItem(title: title, quantity: '', category: '', done: false);
  // }

  factory GroceryItem.fromJson(Map<String, dynamic> json) => _$GroceryItemFromJson(json);
}
