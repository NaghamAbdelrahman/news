import 'package:flutter/material.dart';
import 'package:news/ui/category/source_tab_item.dart';
import 'package:news/ui/news/news_list.dart';

import '../../core/model/Source.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources;

  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: DefaultTabController(
            length: widget.sources.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  labelPadding: const EdgeInsets.all(10),
                  indicatorColor: Colors.transparent,
                  tabs: widget.sources
                      .map((source) => SourceTabItem(source,
                          widget.sources.indexOf(source) == selectedIndex))
                      .toList(),
                  isScrollable: true,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                Expanded(child: NewsList(widget.sources[selectedIndex])),
              ],
            )));
  }
}
