import 'package:flutter/material.dart';
import 'package:recipe_book/models/recipe_list.dart';
import 'package:recipe_book/widgets/instructions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[500],
      appBar: AppBar(
        title: Text(
          "Recipe Book",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight(500)),
        ),
        backgroundColor: Colors.brown[500],
      ),
      body: GridView.builder(
        itemCount: recipes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.brown[300],
            child: InkWell(
              onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => Instructions(recipe: recipes[index],),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage(recipes[index].recipeImage),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Text(
                        recipes[index].recipeName,
                        style: TextStyle(fontWeight: FontWeight(500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
