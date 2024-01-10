import 'package:flutter/cupertino.dart';
import 'main.dart';

void showPicker(
    BuildContext context, TextEditingController controller, List list) {
  final _pickerItems = list.map((item) => Text(item)).toList();
  var selectedIndex = 0;

  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 216,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: CupertinoPicker(
            itemExtent: 32,
            children: _pickerItems,
            onSelectedItemChanged: (int index) {
              selectedIndex = index;
            },
          ),
        ),
      );
    },
  ).then((_) {
    if (selectedIndex != Null) {
      controller.value = TextEditingValue(text: list[selectedIndex]);
    }
  });
}
