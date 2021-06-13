import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../Widget/meal_item.dart';

class CategoryMealScrean extends StatefulWidget {
  static const routename = 'category_item' ;
  // ignore: unused_field
  final List<Meal> _freemeal;
  CategoryMealScrean(this._freemeal);
  @override
  _CategoryMealScreanState createState() => _CategoryMealScreanState();
}
class _CategoryMealScreanState extends State<CategoryMealScrean> {
  String? categoryTitle;
  late List <Meal> categorymeal;
  
  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Map <String , String> ;
    final categoryId = routeArg['id'];
     categoryTitle = routeArg['title'];
     categorymeal = widget._freemeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    
    super.didChangeDependencies();
  }
  

  // void _removeItem (String mealId){
  //   setState(() {
  //     categorymeal.removeWhere((meal) => meal.id == mealId);
  //   });
  // }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!,
          style: TextStyle(fontSize: 25.0 ,
          fontFamily: 'Staatliches' 
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx , index) {
          return MealItem(
           // removeItem: _removeItem ,
            id: categorymeal[index].id ,
            imageUrl: categorymeal[index].imageUrl,
            title: categorymeal[index].title,
            duration: categorymeal[index].duration,
            comlexity: categorymeal[index].comlexity,
            affordability: categorymeal[index].affordability,
            );
        },
        itemCount: categorymeal.length ,
        ),
      );
  }
}