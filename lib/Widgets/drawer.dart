import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/filters_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          color: Theme.of(context).accentColor,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
          leading: Icon(
            Icons.restaurant,
            size: 26,
          ),
          title: Text(
            'Meals',
            style: TextStyle(
                fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushReplacementNamed(context, FilterScreen.routeName);
          },
          leading: Icon(
            Icons.settings,
            size: 26,
          ),
          title: Text(
            'Filters',
            style: TextStyle(
                fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
