import 'package:flutter/material.dart';
import '../Widget/main_drawer.dart';

class FilterScrean extends StatefulWidget {
  static const routeName = 'filters';
  final Function savefiltter;
  final Map<String , bool> crfilter;

  FilterScrean(this.crfilter , this.savefiltter);

  @override
  _FilterScreanState createState() => _FilterScreanState();
}

class _FilterScreanState extends State<FilterScrean> {
   
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegtarian = false;

  @override
  initState(){
       _glutenFree = widget.crfilter['gluten']!;
       _lactoseFree = widget.crfilter['lactose']!;
       _vegan = widget.crfilter['vegan']!;
       _vegtarian = widget.crfilter['vegetarian']!;
    super.initState();
  }

  Widget buildSwitchListTile(String? title, String? subtitle, bool cruntvalue,
      Function(bool)? updatevalue) {
    return SwitchListTile(
      title: Text(
        title!,
        style: TextStyle(fontFamily: 'Staatliches', fontSize: 15.0),
      ),
      value: cruntvalue,
      subtitle: Text(subtitle!),
      onChanged: updatevalue,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters",
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Staatliches',
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String , bool> selectfilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegtarian
                };
                widget.savefiltter(selectfilter);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15.0),
            //color: Colors.teal,
            child: Text(
              "Adjust Your Meal Selection",
              style: TextStyle(fontFamily: 'Staatliches', fontSize: 25.0),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  "Gluten-Free", "Only Include  Gluten free meals", _glutenFree,
                  (newvalue) {
                setState(() {
                  _glutenFree = newvalue;
                });
              }),
              buildSwitchListTile("Lactose-Free",
                  "Only Include Lactose free meals", _lactoseFree, (newvalue) {
                setState(() {
                  _lactoseFree = newvalue;
                });
              }),
              buildSwitchListTile(
                  "Vegan-Free", "Only Include Vegan free meals", _vegan,
                  (newvalue) {
                setState(() {
                  _vegan = newvalue;
                });
              }),
              buildSwitchListTile("Vegtarian-Free",
                  "Only Include Vegtarian free meals", _vegtarian, (newvalue) {
                setState(() {
                  _vegtarian = newvalue;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
