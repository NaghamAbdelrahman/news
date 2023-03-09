import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  Function categoryOnTap;

  DrawerContent({required this.categoryOnTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          color: Theme.of(context).primaryColor,
          width: double.infinity,
          height: 110,
          child: Text(
            'News App!',
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            categoryOnTap();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const ImageIcon(
                  AssetImage('assets/images/ic_list.png'),
                  size: 42,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
