import 'package:flutter/material.dart';
import '/Widget/meal_item.dart';
import '../Models/meal.dart';
class Favorite extends StatelessWidget {
  final List<Meal> favoritemeal;

   Favorite( this.favoritemeal);
@override
  Widget build(BuildContext context) {
    if (favoritemeal.isEmpty){
      return Center(
      child: Text("You have no Favorites yet - start adding one!") 
    );
    }
    else{
      return  ListView.builder(
        itemBuilder: (ctx , index) {
          return MealItem(
            //removeItem: _removeItem ,
            id: favoritemeal[index].id ,
            imageUrl: favoritemeal[index].imageUrl,
            title: favoritemeal[index].title,
            duration: favoritemeal[index].duration,
            comlexity: favoritemeal[index].comlexity,
            affordability: favoritemeal[index].affordability,
            );
        },
        itemCount: favoritemeal.length ,
        );
    }
    
  }
}