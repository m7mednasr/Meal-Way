import 'package:flutter/material.dart';
import './Models/meal.dart';
import './dummy_data.dart';
import './Screans/Tab_screan.dart';
import './Screans/filter_screan.dart';
import './Screans/meal_detail_widget.dart';
import './Screans/category_meal_screan.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: unused_field
  Map<String , bool> _filtter ={
    'gluten' : false ,
    'lactose' : false ,
    'vegan' : false ,
    'vegetarian' : false 
  };
  List<Meal> _freemeal = DUMMY_MEALS;
  List<Meal> _favoritemeal = [];

  void _setflitter(Map<String , bool> _filtterDate){
    setState(() {
      _filtter = _filtterDate;
      _freemeal = DUMMY_MEALS.where((meal) {
        if (_filtter['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if (_filtter['lactose']! && !meal.isLactoseFree){
          return false;
        }
        if(_filtter['vegan']! && !meal.isVegan){
          return false;
        }
        if (_filtter['vegetarian']! && !meal.isVegtarian){
          return false;
        }
        return true;
      }).toList();
    });
  }
  
  void tofavorite(String mealId){
    final exIndex = _favoritemeal.indexWhere((meal) => meal.id == mealId);
    if (exIndex>=0){
      setState(() {
        _favoritemeal.removeAt(exIndex);
      });
    }
    else{
      setState(() {
        _favoritemeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }
bool ismealfavorite(String? id){
  return _favoritemeal.any((meal) => meal.id == id);
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
       // brightness: Brightness.dark,
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        accentTextTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(  
            color: Color.fromRGBO(20, 50 , 50 , 1)
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1)
          ),
          headline1: TextStyle(
            fontSize: 100 ,
            fontFamily: 'Staatliches'
          ), 
        )
      ),
      routes: {
        '/' : (context) => TabScrean(_favoritemeal),
        CategoryMealScrean.routename : (context) => CategoryMealScrean(_freemeal),
        MealDetailWidget.routename : (context) => MealDetailWidget(tofavorite , ismealfavorite),
        FilterScrean.routeName : (context) => FilterScrean(_filtter ,_setflitter),
      },
    );
  }
}
