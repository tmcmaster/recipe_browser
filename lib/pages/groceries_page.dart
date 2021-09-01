import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_browser/providers/groceries_provider.dart';
import 'package:recipe_browser/widgets/editable_list_view_input.dart';
import 'package:recipe_browser/widgets/groceries_list_tile.dart';

class GroceriesPage extends ConsumerWidget {
  static final name = '/groceries';
  static final USE_DEVICE_PREVIEW = false;

  final _addMode = StateProvider((ref) => false);

  GroceriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final items = watch(groceryItemsProvider);
    final notifier = context.read(groceryItemsProvider.notifier);
    final addMode = watch(_addMode).state;
    final theme = Theme.of(context);
    final padding = (USE_DEVICE_PREVIEW && kIsWeb ? 30.0 : 0.0);
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          toolbarHeight: 50.0 + padding,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: colors.primary),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Padding(
            padding: EdgeInsets.only(top: padding),
            child: Row(
              children: [
                Text(
                  'Grocery List',
                  style: TextStyle(color: theme.colorScheme.primary),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  // color: Colors.red,
                  child: ReorderableListView(
                    dragStartBehavior: DragStartBehavior.start,
                    buildDefaultDragHandles: false,
                    onReorder: (oldIndex, newIndex) {
                      notifier.move(oldIndex, newIndex);
                    },
                    children: items
                        .asMap()
                        .entries
                        .map((e) => ReorderableDragStartListener(
                              key: ValueKey('drag-${e.key}'),
                              index: e.key,
                              child: Dismissible(
                                background: Container(color: Colors.red),
                                key: ValueKey(e.value.id),
                                onDismissed: (_) {
                                  notifier.remove(e.value);
                                },
                                child: SizedBox(
                                  height: 60,
                                  child: GroceriesListTile(index: e.key),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Container(
                height: (addMode ? 160 : 110),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 2.0, color: Colors.grey.shade400),
                  ),
                ),
                child: Column(
                  children: [
                    if (addMode)
                      SizedBox(
                        height: 50,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: EditableListViewInput(),
                        ),
                      ),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                              padding: EdgeInsets.symmetric(vertical: 0),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  context.read(_addMode).state = !context.read(_addMode).state;
                                  print('Read Mode: ${context.read(_addMode).state}');
                                },
                                child: Text(
                                  (context.read(_addMode).state == false ? '+ Add Item' : 'Done'),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
