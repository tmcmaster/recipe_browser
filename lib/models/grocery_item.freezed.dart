// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'grocery_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroceryItem _$GroceryItemFromJson(Map<String, dynamic> json) {
  return _GroceryItem.fromJson(json);
}

/// @nodoc
class _$GroceryItemTearOff {
  const _$GroceryItemTearOff();

  _GroceryItem call(
      {required String id,
      required String title,
      required String quantity,
      required String category,
      required bool done}) {
    return _GroceryItem(
      id: id,
      title: title,
      quantity: quantity,
      category: category,
      done: done,
    );
  }

  GroceryItem fromJson(Map<String, Object> json) {
    return GroceryItem.fromJson(json);
  }
}

/// @nodoc
const $GroceryItem = _$GroceryItemTearOff();

/// @nodoc
mixin _$GroceryItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroceryItemCopyWith<GroceryItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroceryItemCopyWith<$Res> {
  factory $GroceryItemCopyWith(GroceryItem value, $Res Function(GroceryItem) then) = _$GroceryItemCopyWithImpl<$Res>;
  $Res call({String id, String title, String quantity, String category, bool done});
}

/// @nodoc
class _$GroceryItemCopyWithImpl<$Res> implements $GroceryItemCopyWith<$Res> {
  _$GroceryItemCopyWithImpl(this._value, this._then);

  final GroceryItem _value;
  // ignore: unused_field
  final $Res Function(GroceryItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? quantity = freezed,
    Object? category = freezed,
    Object? done = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$GroceryItemCopyWith<$Res> implements $GroceryItemCopyWith<$Res> {
  factory _$GroceryItemCopyWith(_GroceryItem value, $Res Function(_GroceryItem) then) =
      __$GroceryItemCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, String quantity, String category, bool done});
}

/// @nodoc
class __$GroceryItemCopyWithImpl<$Res> extends _$GroceryItemCopyWithImpl<$Res> implements _$GroceryItemCopyWith<$Res> {
  __$GroceryItemCopyWithImpl(_GroceryItem _value, $Res Function(_GroceryItem) _then)
      : super(_value, (v) => _then(v as _GroceryItem));

  @override
  _GroceryItem get _value => super._value as _GroceryItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? quantity = freezed,
    Object? category = freezed,
    Object? done = freezed,
  }) {
    return _then(_GroceryItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroceryItem implements _GroceryItem {
  _$_GroceryItem(
      {required this.id, required this.title, required this.quantity, required this.category, required this.done});

  factory _$_GroceryItem.fromJson(Map<String, dynamic> json) => _$_$_GroceryItemFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String quantity;
  @override
  final String category;
  @override
  final bool done;

  @override
  String toString() {
    return 'GroceryItem(id: $id, title: $title, quantity: $quantity, category: $category, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GroceryItem &&
            (identical(other.id, id) || const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) || const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.quantity, quantity) || const DeepCollectionEquality().equals(other.quantity, quantity)) &&
            (identical(other.category, category) || const DeepCollectionEquality().equals(other.category, category)) &&
            (identical(other.done, done) || const DeepCollectionEquality().equals(other.done, done)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(done);

  @JsonKey(ignore: true)
  @override
  _$GroceryItemCopyWith<_GroceryItem> get copyWith => __$GroceryItemCopyWithImpl<_GroceryItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GroceryItemToJson(this);
  }
}

abstract class _GroceryItem implements GroceryItem {
  factory _GroceryItem(
      {required String id,
      required String title,
      required String quantity,
      required String category,
      required bool done}) = _$_GroceryItem;

  factory _GroceryItem.fromJson(Map<String, dynamic> json) = _$_GroceryItem.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get quantity => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  bool get done => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GroceryItemCopyWith<_GroceryItem> get copyWith => throw _privateConstructorUsedError;
}
