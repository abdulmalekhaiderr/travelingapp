import 'package:flutter/material.dart';
import 'package:traveling_app/scream/CategoriesScreen.dart';
import 'package:traveling_app/scream/category_trip_screan.dart';
import 'package:traveling_app/scream/filters_screan.dart';
import 'package:traveling_app/scream/trip_detail_sctrean.dart';

import 'scream/tabs_screan.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Map<String,bool> _fitter={
  //   "Summer": false,
  //   "winter": false,
  //   "family":false,
  // };
/* void  _changfitters( Map<String,bool> _fitterData){
       setState(() {
         _fitter=_fitterData;
       });
 }*/


  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor:Colors.amber,
        fontFamily: "Cairo",
        textTheme: ThemeData.light().textTheme.copyWith(
          headline1:TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
          ) ,
            headline6:TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
            )
        ),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        "/":(ctx)=>TabsScrean(),
        CategoryTripScrean.scraenRouter:(ctx)=>CategoryTripScrean(),
        TripdetailScraen.screanRout:(ctx)=>TripdetailScraen(),
        FiltersScrean.screanRoute:(ct)=>FiltersScrean(),

      },
    );
  }
}
