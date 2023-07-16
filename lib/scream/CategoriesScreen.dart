import 'package:flutter/material.dart';
import '../app_date.dart';
import '../widgets/categoty_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding:const EdgeInsets.all(10),
        gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: Categories_data.map((categordata) => CategorItem(
            categordata.id,
            categordata.title,
            categordata.imageUrl
        )).toList(),
      );
  }
}
