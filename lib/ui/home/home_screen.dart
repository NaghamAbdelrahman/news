import 'package:flutter/material.dart';
import 'package:news/ui/home/category_news_list.dart';

import 'category.dart';
import 'drawer_content.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categories = [
    Category(id: 'sports', tittle: 'Sports', color: const Color(0xffC91C22)),
    Category(
        id: 'Politics', tittle: 'Politics', color: const Color(0xff003E90)),
    Category(id: 'health', tittle: 'Health', color: const Color(0xffED1E79)),
    Category(
        id: 'bussines', tittle: 'Bussines', color: const Color(0xffCF7E48)),
    Category(
        id: 'environment',
        tittle: 'Enviroment',
        color: const Color(0xff4882CF)),
    Category(id: 'science', tittle: 'Science', color: const Color(0xffF2D352)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              selectedCategory == null ? 'News App' : selectedCategory!.tittle),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
        ),
        drawer: Drawer(
          child: DrawerContent(categoryOnTap: () {
            setState(() {
              selectedCategory = null;
              Navigator.pop(context);
            });
          }),
        ),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Pick your category\nof interest',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xff4F5A69),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: .91),
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                            category: categories[index],
                            index: index,
                            onClickItem: onClick,
                          );
                        },
                        itemCount: categories.length,
                      ),
                    ),
                  ],
                ),
              )
            : const CategoryNewsList(),
      ),
    );
  }

  Category? selectedCategory = null;

  void onClick(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
