import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFunction, isFavorite;
  static const routeName = 'DetailScreen';
  const MealDetailScreen({Key key, this.toggleFunction, this.isFavorite})
      : super(key: key);

  Container buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  buildContainer({Widget child}) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var routeArgs = ModalRoute.of(context).settings.arguments as Map;
    var filteredStuff = DUMMY_MEALS.where((element) {
      return element.id == routeArgs['id'];
    }).toList()[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(filteredStuff.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                filteredStuff.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child:
                          Center(child: Text(filteredStuff.ingredients[index])),
                    ),
                  );
                },
                itemCount: filteredStuff.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider();
                },
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '${1 + index}',
                    ),
                  ),
                  title: Text(filteredStuff.steps[index]),
                ),
                itemCount: filteredStuff.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:
            Icon(isFavorite(routeArgs['id']) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFunction(routeArgs['id']),
      ),
    );
  }
}
