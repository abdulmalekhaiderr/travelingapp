import 'package:flutter/material.dart';
import 'package:traveling_app/app_date.dart';

class TripdetailScraen extends StatelessWidget {
  static const screanRout = 'trip-detail';

  buildsectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  buildListview(Widget child) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.topRight,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectorTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectorTrip.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectorTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildsectionTitle(context, "الانشطة"),
            buildListview(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(selectorTrip.activities[index]),
                  ),
                ),
                itemCount: selectorTrip.activities.length,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildsectionTitle(context, "البرنامج اليومي"),
            buildListview(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("اليوم ${index + 1}"),
                    ),
                    title: Text(selectorTrip.program[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectorTrip.program.length,
            )),
            SizedBox(
              width: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton
        (child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(tripId);
        },),
    );
  }
}
