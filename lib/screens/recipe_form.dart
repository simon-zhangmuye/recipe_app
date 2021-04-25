import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeForm extends StatefulWidget {
  @override
  _RecipeFormState createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final recipeFormKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController directionsController = TextEditingController();
  String categoryDropdownValue;

  Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (recipeFormKey.currentState.validate()) {
                  recipe = Recipe(
                      title: titleController.text,
                      category: categoryDropdownValue,
                      ingredients: ingredientsController.text,
                      directions: directionsController.text);
                  Navigator.pop(context, recipe);
                }
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: Form(
        key: recipeFormKey,
        child: ListView(
          children: [
            ListTile(
              title: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Title',
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
                autovalidate: false,
                controller: titleController,
              ),
            ),
            ListTile(
              title: DropdownButtonFormField(
                validator: (value) {
                  if (value == null) {
                    return 'category is required';
                  }
                  return null;
                },
                autovalidate: false,
                value: categoryDropdownValue,
                hint: Text('Category'),
                icon: Icon(Icons.arrow_drop_down),
                items: ['Appetizer', 'Main Course', 'Dessert']
                    .map((String value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String value) {
                  setState(() {
                    categoryDropdownValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ingredients',
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: null,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Ingredients is required';
                  }
                  return null;
                },
                autovalidate: false,
                controller: ingredientsController,
              ),
            ),
            ListTile(
              title: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Directions',
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: null,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Directions is required';
                  }
                  return null;
                },
                autovalidate: false,
                controller: directionsController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
