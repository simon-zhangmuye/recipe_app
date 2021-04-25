import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/recipe_detail.dart';
import 'package:recipe_app/screens/recipe_form.dart';

class RecipeHome extends StatefulWidget {
  @override
  _RecipeHomeState createState() => _RecipeHomeState();
}

class _RecipeHomeState extends State<RecipeHome> {
  List<Recipe> recipes = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Recipe Home'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          Recipe item = recipes[index];
          return Card(
            child: ListTile(
              title: FlatButton(
                padding: EdgeInsets.all(0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(item.title),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeDetail(item)));
                },
              ),
              subtitle: Text(item.category),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    recipes.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Recipe recipe = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => RecipeForm()));
          if (recipe != null) {
            setState(() {
              recipes.add(recipe);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
