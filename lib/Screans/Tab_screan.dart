import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../Screans/Favorite.dart';
import '../Screans/Category_Screan.dart';
import '../Widget/main_drawer.dart';

class TabScrean extends StatefulWidget {
  final List<Meal> favoritemeal;

   TabScrean( this.favoritemeal);
@override
  _TabScreanState createState() => _TabScreanState();
}

class _TabScreanState extends State<TabScrean> {
   late List<Map<String , dynamic>> pages ;
  int selectPageIndex= 0;
  void _selectPage(int value){
    setState(() {
      selectPageIndex = value;
    });
  }
  @override
  void initState(){
    pages =  [
    {
      'page' : CategiryScrean(),
      'title' : 'Categories'
    },
    {
      'page' : Favorite(widget.favoritemeal),
      'title': 'Favorites'
    }
  ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectPageIndex]['title']),
      ),
      body: pages[selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            // ignore: deprecated_member_use
            title: Text("Categories")
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.star),
            // ignore: deprecated_member_use
            title: Text("Favorites")
          ),
        ],
        ),
    drawer: MainDrawer(),
    );
  }
}