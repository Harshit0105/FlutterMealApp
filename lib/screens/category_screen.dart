import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
      child: GridView(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2.5),
          children: DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.id,catData.title,catData.color,)).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
          ),
      ),
    );
  }
}
