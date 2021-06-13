import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailWidget extends StatelessWidget {
  static const routename = 'meal_detail';
  final Function tofavorite;
  final Function ismealfavorite;

  const MealDetailWidget( this.tofavorite, this.ismealfavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectmeal = DUMMY_MEALS.firstWhere((meals) => meals.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectmeal.title!,
          style: TextStyle(fontSize: 25.0, fontFamily: 'Staatliches'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectmeal.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text("Ingredients",
                  style: TextStyle(fontSize: 20.0, fontFamily: 'Staatliches')),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        selectmeal.ingredients[index]!,
                        style: TextStyle(
                            fontSize: 15.0, fontFamily: 'Staatliches'),
                      ),
                    ),
                  );
                },
                itemCount: selectmeal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text("Steps",
                  style: TextStyle(fontSize: 20.0, fontFamily: 'Staatliches')),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListView.builder(
                itemBuilder: (cxt, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("${index+1}"),
                        ) ,
                        title: Text(selectmeal.steps[index]!),
                      ),
                      Divider(
                        height: 5.0,
                      ),
                    ],
                  );
                },
                itemCount: selectmeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>tofavorite(mealId),
        child: Icon(ismealfavorite(mealId) ? Icons.star :Icons.star_border , 
        color: Colors.black,
        size: 30,
        ),
        backgroundColor: Theme.of(context).accentColor,
         elevation: 4,
      ),
    );
  }
}
