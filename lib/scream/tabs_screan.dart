import 'package:flutter/material.dart';
import 'package:traveling_app/scream/CategoriesScreen.dart';
import '../scream/favorites_screan.dart';

import '../widgets/app_draw.dart';

class TabsScrean extends StatefulWidget {
  const TabsScrean({Key? key}) : super(key: key);

  @override
  State<TabsScrean> createState() => _TabsScreanState();
}

class _TabsScreanState extends State<TabsScrean> {


  _selectScrean(int index){
    setState(() {
      _selectedScreanindex=index;
    });
  }

  int _selectedScreanindex=0;
  final  List<Map<String,dynamic>> _selectscrean=[
    {
      'Screan':CategoriesScreen(),
      'Title':"تصنيفات الرحلات",
    },
    {
      'Screan': FavoritesScrean(),
      'Title':'لرحلات المفضلة',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectscrean[_selectedScreanindex]['Title']),

      ),
      drawer: AppDrawer(),
      body:_selectscrean[_selectedScreanindex]['Screan'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScrean,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreanindex,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
        label: "التصنيفات"),
        BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "المفضلة"),

      ],
    ),
    );
  }
}
