import 'package:flutter/material.dart';
import 'package:recipe_book/models/recipe_data.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key, required this.recipe});
  final RecipeData recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[500],
      appBar: AppBar(
        title: Text(recipe.recipeName),
        backgroundColor: Colors.brown[500],
      ),
      body: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage(recipe.recipeImage),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.brown[300],
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Text(recipe.ingredients),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.brown[300],
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Text(recipe.instructions, textAlign: TextAlign.left),
          ),
        ],
      ),
    );
  }
}
