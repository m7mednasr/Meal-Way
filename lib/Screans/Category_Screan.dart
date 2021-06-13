import 'package:flutter/material.dart';
import '../Widget/category_item.dart';
import '../dummy_data.dart';
class CategiryScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200 ,
        crossAxisSpacing: 20 ,
        mainAxisSpacing: 20 ,
        childAspectRatio: 3/2
      ),
      padding: EdgeInsets.all(15.0),
      children: DUMMY_CATEGORIES.map((e) => 
      CategoryItem(e.id, e.title, e.color,),
      ).toList(),
    )
    );
  }
}