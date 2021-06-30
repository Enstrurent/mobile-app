import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownChips extends StatelessWidget {
  final RxList observableList;
  final List<String> dropdownItems;

  final String dropdownHint;

  const DropdownChips(
      {Key? key, required this.observableList, required this.dropdownItems, required this.dropdownHint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
            dropdownColor: Get.theme.backgroundColor,
            hint: Text(dropdownHint),
            onChanged: (value) =>
                observableList.addIf(!observableList.contains(value), value),
            items: dropdownItems
                .map((e) => DropdownMenuItem(child: Text(e), value: e))
                .toList()),
        Obx(
          () => Wrap(
            spacing: 8.0,
            children: observableList
                .map(
                  (element) => InputChip(
                      backgroundColor: Get.theme.accentColor,
                      elevation: 10,
                      onDeleted: () => observableList.remove(element),
                      label: Text(element)),
                )
                .toList(),

          ),
        ),
      ],
    );
  }
}
