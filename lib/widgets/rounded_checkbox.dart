import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundCheckbox extends StatelessWidget {
  const RoundCheckbox({
    Key? key,
    required this.checked,
    required this.onChanged,
  }) : super(key: key);

  final bool checked;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    // fillColor: MaterialStateProperty.all(Colors.grey.shade400),
    /// TODO: need to sort out the colour properly
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: checked ? Colors.grey.shade300 : Colors.orange),
          color: checked ? Colors.grey.shade300 : Colors.white,
        ),
        child: Checkbox(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          fillColor: MaterialStateProperty.all(checked ? Colors.grey.shade300 : Colors.white),
          value: checked,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
