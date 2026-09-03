import 'recipe_data.dart';

final List<RecipeData> recipes = [
  RecipeData(
    recipeName: 'Classic Cappuccino',
    recipeImage: 'assets/classic_cappuccino.jpg',
    ingredients: """
        1 SHOT OF ESPRESSO
        1/3 CUP OF STEAMED MILK
        1/3 CUP OF MILK FOAM
        """,
    instructions: """
      1. Brew a shot of espresso using your espresso machine.
      2. Froth 1/3 cup of milk using your milk frother until it reaches a creamy texture.
      3. Steam another 1/3 cup of milk until it's hot but not boiling.
      4. Pour the shot of espresso into a cup, then add the steamed milk.
      5. Top the drink with the milk foam.
      6. Optionally, sprinkle with cocoa powder or cinnamon for garnish.
      """,
  ),

  RecipeData(
    recipeName: 'Latte Macchiato',
    recipeImage: 'assets/latte_macchiato.jpg',
    ingredients: """
      1 SHOT OF ESPRESSO
      1 CUP OF STEAMED MILK
      """,
    instructions: """
      1. Brew a shot of espresso and set it aside.
      2. Froth 1 cup of milk until it's creamy and frothy.
      3. Pour the steamed milk slowly over the espresso in a glass, allowing the milk to form layers with the espresso.
      4.Serve immediately and optionally sprinkle with cocoa powder or chocolate shavings.
      """,
  ),

  RecipeData(
    recipeName: 'Mocha Latte',
    recipeImage: 'assets/mocha_latte.jpg',
    ingredients: """
      1 SHOT OF ESPRESSO
      1 CUP OF STEAMED MILK
      2 TABLESPOONS OF CHOCOLATE SYRUP
      """,
    instructions: """
      1. Brew a shot of espresso and set it aside.
      2. Froth 1 cup of milk until creamy.
      3. Warm the chocolate syrup in a microwave or on the stove.
      4. Pour the espresso into a cup, then add the steamed milk and the warmed chocolate syrup.
      5.Stir gently to combine.
      6. Optionally, top with whipped cream and chocolate shavings.
      """,
  ),

  RecipeData(
    recipeName: 'Honey Almond Latte',
    recipeImage: 'assets/honey_almond_latte.jpg',
    ingredients: """
      1 SHOT OF ESPRESSO
      1 CUP OF ALMOND MILK
      1 TABLESPOON OF HONEY
      """,
    instructions: """
      1. Add honey to the almond milk before frothing.
      2. Froth the almond milk until it's creamy.
      3. Pour the espresso into a cup.
      4. Pour the frothed almond milk over the espresso.
      """,
  ),
];
