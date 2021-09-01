import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_browser/providers/groceries_provider.dart';
import 'package:recipe_browser/widgets/rounded_checkbox.dart';

class GroceriesListTile extends HookWidget {
  final int index;

  GroceriesListTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = true; //!kIsWeb; //Platform.isAndroid || Platform.isIOS;

    print('Building item $index');
    final notifier = context.read(groceryItemsProvider.notifier);
    final groceryItem = useProvider(groceryItemFamily(index));
    final itemFocusNode = useFocusNode();
    // listen to focus chances
    useListenable(itemFocusNode);
    final isFocused = itemFocusNode.hasFocus;

    final textEditingController = useTextEditingController();
    final textFieldFocusNode = useFocusNode();

    return Container(
      height: double.infinity,
      child: SizedBox(
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.only(top: 6),
            //color: Colors.purple,
            child: RoundCheckbox(
              checked: groceryItem.done,
              onChanged: (value) => notifier.done(groceryItem, value),
            ),
          ),
          trailing: isMobile
              ? Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Icon(
                    Icons.menu,
                    color: groceryItem.done ? Colors.grey.shade400 : Colors.black,
                  ),
                )
              : null,
          title: Container(
            height: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 0),
            decoration: BoxDecoration(
              //color: Colors.yellow,
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            child: Focus(
              focusNode: itemFocusNode,
              onFocusChange: (focused) {
                if (focused) {
                  if (groceryItem.done) {
                    itemFocusNode.unfocus();
                  }
                  textEditingController.text = groceryItem.title;
                } else {
                  // Commit changes only when the textfield is unfocused, for performance
                  notifier.title(groceryItem, textEditingController.text);
                }
              },
              child: Container(
                child: isFocused && !groceryItem.done
                    ? Container(
                        padding: EdgeInsets.only(top: 6),
                        child: TextField(
                          enabled: !groceryItem.done,
                          autofocus: true,
                          focusNode: textFieldFocusNode,
                          controller: textEditingController,
                          decoration: InputDecoration(
                            fillColor: Colors.red,
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    : Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {
                              itemFocusNode.requestFocus();
                              textFieldFocusNode.requestFocus();
                            },
                            child: Text(
                              groceryItem.title,
                              style: TextStyle(color: groceryItem.done ? Colors.grey.shade500 : Colors.black),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
