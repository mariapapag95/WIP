import 'package:flutter/material.dart';

class ClickableTextList extends StatelessWidget {
  const ClickableTextList({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final itemText = items[index];
        return ListTile(
          title: Text(itemText),
          onTap: () {
            print('Clicked: $itemText');
          },
        );
      },
    );
  }
}
