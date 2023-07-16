import 'package:flutter/material.dart';
import 'package:traveling_app/scream/category_trip_screan.dart';

class CategorItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CategorItem(this.id, this.title, this.imageUrl);
  void selectcategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      CategoryTripScrean.scraenRouter,
      arguments: {
        "id":id,
        "title":title,

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectcategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style:Theme.of(context).textTheme.headline6,
            ),

            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            )
          )
        ],
      ),
    );
  }
}
