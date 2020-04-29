import 'package:flutter/material.dart';

import 'package:meals/dummy_data.dart';
import 'package:meals/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: GridView(
        padding: EdgeInsets.all(25),
        children: <Widget>[
          ...DUMMY_CATEGORIES
              .map(
                (catData) => CategoryItem(
                  id: catData.id,
                  title: catData.title,
                  color: catData.color,
                ),
              )
              .toList(),
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
