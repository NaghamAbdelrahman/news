import 'package:flutter/material.dart';

import '../../domain/model/Source.dart';

class SourceTabItem extends StatelessWidget {
  Source source;
  bool selectedItem;

  SourceTabItem(this.source, this.selectedItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: selectedItem
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: Text(
        '${source.name}',
        style: TextStyle(
            color:
                selectedItem ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
