import 'package:flutter/material.dart';
import 'package:simple_recipe_app/data/recipe_data.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(image: AssetImage(widget.recipe.imageUrl)),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.recipe.label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(7.0),
              itemCount: widget.recipe.ingredient.length,
              itemBuilder: (BuildContext context, int index) {
                final Ingredient = widget.recipe.ingredient[index];
                return Text('${Ingredient.quantity * _sliderVal} '
                    '${Ingredient.measure} '
                    '${Ingredient.name}');
              },
            ),
          ),
          Slider(
              max: 10,
              min: 1,
              divisions: 10,
              activeColor: Colors.green,
              inactiveColor: Colors.black,
              label: '${_sliderVal * widget.recipe.serving} servings',
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              })
        ],
      )),
    );
  }
}
