import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  RecipeDetail(this.recipe);

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
              child: Image(
                image: AssetImage(
                  widget.recipe.imageUrl,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext ctx, int index) {
                  final Ingredient ingredient =
                      widget.recipe.ingredients[index];
                  return Text(
                      '${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}');
                },
              ),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '${widget.recipe.servings * _sliderVal} servings',
              value: _sliderVal.toDouble(),
              activeColor: Colors.green,
              inactiveColor: Colors.black,
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
