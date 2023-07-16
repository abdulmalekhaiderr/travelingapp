import 'package:flutter/material.dart';

import '../widgets/app_draw.dart';

class FiltersScrean extends StatefulWidget {

  static const screanRoute = "/fiters";
  // final Function saveFitter;
  // FiltersScrean(this.saveFitter);


  @override
  State<FiltersScrean> createState() => _FiltersScreanState();
}

class _FiltersScreanState extends State<FiltersScrean> {
  var isInSommer = false;
  var isInWinter = false;
  var isForFamily = false;
  Widget buildmothod(String title,String Subtitle,var currentvule, updateValue){
    return  SwitchListTile(
        title: Text(title),
        subtitle: Text(Subtitle),
        value: currentvule, onChanged:updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
        //   IconButton(
        //       icon: Icon(Icons.save),
        //       //onPressed:,
        // ),
        ],
        title: Text("الفلاترة"),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 50,),
                buildmothod(
                    "الرحلات الصيفية فقط ",
                "اظهار الرحلات الصيفية فقط",isInSommer,
                    (newvalue){
                      setState(() {
                        isInSommer=newvalue;
                      });
                    }),
                SizedBox(height: 20,),
                buildmothod(
                    "الرحلات الشتوية فقط ",
                    "اظهار الرحلات الشتاء فقط",isInWinter,
                        (newvalue){
                      setState(() {
                        isInWinter=newvalue;
                      });
                    }),
                buildmothod(
                    "للعائلات ",
                    "اظهار الرحلات التي العائلات فقط",isForFamily,
                        (newvalue){
                      setState(() {
                        isForFamily=newvalue;
                      });
                    }),
                ],
            ),
          )
        ],
      ),
    );
  }
}
