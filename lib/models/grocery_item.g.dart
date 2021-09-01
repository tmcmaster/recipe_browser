// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroceryItem _$_$_GroceryItemFromJson(Map json) {
  return _$_GroceryItem(
    id: json['id'] as String,
    title: json['title'] as String,
    quantity: json['quantity'] as String,
    category: json['category'] as String,
    done: json['done'] as bool,
  );
}

Map<String, dynamic> _$_$_GroceryItemToJson(_$_GroceryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'quantity': instance.quantity,
      'category': instance.category,
      'done': instance.done,
    };
