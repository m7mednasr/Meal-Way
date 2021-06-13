import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../Screans/meal_detail_widget.dart';

class MealItem extends StatelessWidget {
  final String? id;
  final String? imageUrl;
  final String? title;
  final int? duration;
  final Comlexity comlexity;
  final Affordability affordability;
  //final Function removeItem;

  const MealItem({
      required this.id,
      required this.imageUrl,
      required this.title,
      required this.duration,
      required this.comlexity,
      required this.affordability, 
     // required this.removeItem,
      });

  String? get comlexityitem {
    switch (comlexity){
      // ignore: dead_code
      case Comlexity.Simple : return 'Simple' ; break;
      // ignore: dead_code
      case Comlexity.Challenging : return 'Challenging'; break;
      // ignore: dead_code
      case Comlexity.Hard : return 'Hard'; break;
      // ignore: dead_code
      default : return 'Unknown'; break;
    }
  } 
    String? get affordabilityitem {
    switch (affordability){
      // ignore: dead_code
      case Affordability.Affordable : return 'Affordable' ; break;
      // ignore: dead_code
      case Affordability.Luxurious : return 'Luxurious'; break;
      // ignore: dead_code
      case Affordability.Pricey : return 'Pricey'; break;
      // ignore: dead_code
      default : return 'Unknown'; break;
    }
  } 
      void slectitem(BuildContext ctx){
        Navigator.of(ctx).pushNamed(MealDetailWidget.routename , 
        arguments: id ,
        ).then((result) {
         // if (result != null) removeItem(result);
        });
      }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap:()=>slectitem(context),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 4,
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      imageUrl!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 10.0,
                      child: Container(
                        width: 300,
                        color: Colors.black54,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          title!,
                          style: TextStyle(fontSize: 20.0, 
                          fontFamily: 'Staatliches',
                          color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("$duration  Min"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("$comlexityitem  "),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("$affordabilityitem")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
