import 'package:flutter/material.dart';
import 'package:traveling_app/app_date.dart';
import 'package:traveling_app/widgets/trip_item.dart';

import '../models/trip.dart';

class CategoryTripScrean extends StatefulWidget {
  static const scraenRouter="/category-rip";

  @override
  State<CategoryTripScrean> createState() => _CategoryTripScreanState();
}

class _CategoryTripScreanState extends State<CategoryTripScrean> {
   String? categortyTitle;
  late List<Trip> displayTrips;
  @override
  void initState() {

    super.initState();
  }
  void _removeTrip(String tripid){
    setState(() {
      displayTrips.removeWhere((trip) => trip.id==tripid);
    });
  }
  @override
  void didChangeDependencies() {
    final routerargument=
    ModalRoute.of(context)?.settings.
    arguments
    as Map<String,String >;
    final categoryid= routerargument["id"];
    categortyTitle= routerargument["title"];
    displayTrips=Trips_data.where((trip){
      return trip.categories.contains(categoryid);

    }).toList();
    super.didChangeDependencies();
  }
/*
final String categoryid;
final String categorytitle;
CategoryTripScrean(this.categoryid,this.categorytitle);
*/
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categortyTitle!),
      ),
      body:ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TripItem(
              id: displayTrips[index].id,
              title: displayTrips[index].title,
              imageUrl:  displayTrips[index]. imageUrl,
              duration:  displayTrips[index].duration,
              tripType:  displayTrips[index].tripType,
              season:  displayTrips[index].season,
            removeItem: _removeTrip,
          );
        },
        itemCount:displayTrips.length ,
      ),

    );
  }
}
