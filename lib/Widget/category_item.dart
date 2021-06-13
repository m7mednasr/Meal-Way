import 'package:flutter/material.dart';
import '../Screans/category_meal_screan.dart';

class CategoryItem extends StatelessWidget {
   final String? id;
   final String? title;
   final Color color;


   CategoryItem(
     this.id ,
     this.title,
     this.color,
   
   );
   void selectedcategory(BuildContext ctx){
     Navigator.of(ctx).pushNamed(CategoryMealScrean.routename ,
     arguments: {
       'id' : id! ,
       'title' : title!
     }
     );

   }
  @override
  Widget build(BuildContext context) {
    return Material(
          child: InkWell(
        onTap: () => selectedcategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Text(title! , 
          style: TextStyle(
            fontSize: 20 ,
           // fontWeight: FontWeight.bold,
            fontFamily: 'Staatliches'
          ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color
              ] ,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(15)
          ),
        ),
      ),
    );
  }
}