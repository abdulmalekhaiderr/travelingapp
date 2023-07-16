import 'package:flutter/material.dart';
import 'package:traveling_app/scream/filters_screan.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);
  ListTile buildlistTile(String title,IconData icon, onTaplink){
    return  ListTile(
      leading: Icon(
        icon,
        size: 20,
        color: Colors.cyan,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 24,
            fontWeight: FontWeight.bold ),
      ),
      onTap: onTaplink,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              "دليلك السياحي",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildlistTile("االرحلات",Icons.card_travel,(){
            Navigator.of(context).pushReplacementNamed('/');
          }),

          buildlistTile("الفلاترة",Icons.filter_list,(){
            Navigator.of(context).pushReplacementNamed(FiltersScrean.screanRoute);
          }),
        ],

      ),
    );

  }

}
