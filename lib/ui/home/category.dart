import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;
  Function onClickItem;

  CategoryWidget(
      {required this.category, required this.index, required this.onClickItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickItem(category);
      },
      child: Container(
        decoration: BoxDecoration(
            color: category.color,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(18),
              topRight: const Radius.circular(18),
              bottomRight: Radius.circular(index.isEven ? 0 : 18),
              bottomLeft: Radius.circular(index.isEven ? 18 : 0),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/${category.id}.png', height: 110),
            Text(category.tittle, style: Theme.of(context).textTheme.headline6)
          ],
        ),
      ),
    );
  }
}

class Category {
  String id;
  String tittle;
  Color color;

  Category({required this.id, required this.tittle, required this.color});
}
