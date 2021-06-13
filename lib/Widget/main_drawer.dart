import 'package:flutter/material.dart';
import '../Screans/filter_screan.dart';

class MainDrawer extends StatelessWidget {
  Widget returnList(String? title , IconData icon , Color color , VoidCallback press) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title!,
        style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Staatliches',
            fontWeight: FontWeight.bold),
      ),
      onTap: press,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            color: Theme.of(context).accentColor,
            child: Text(
              "CoOk MeAl 😎",
              style: TextStyle(
                  fontFamily: 'Staatliches',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          returnList("Meal",
           Icons.restaurant_menu_rounded, 
           Colors.black,
            () { Navigator.of(context).pushReplacementNamed('/');}
            ),
            returnList("Filters",
             Icons.settings, 
             Colors.black, 
             () { Navigator.of(context).pushReplacementNamed(FilterScrean.routeName);}
             ),
        ],
      ),
    );
  }
}
