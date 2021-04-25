import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  RecipeDetail(this.recipe);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Detail'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Center(child: Text(widget.recipe.title)),
            subtitle: Center(child: Text(widget.recipe.category)),
          ),
          ListTile(
            title: Text('ingredients'),
            subtitle: Text(widget.recipe.ingredients),
          ),
          ListTile(
            title: Text('directions'),
            subtitle: Text(widget.recipe.directions),
          ),
        ],
      ),
    );
  }
}
