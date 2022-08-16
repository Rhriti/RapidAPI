import 'package:flutter/material.dart';
import '../model.dart/recipemodel.dart';




class Mealcard extends StatelessWidget {
  Recipe snapshot;
  Mealcard(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(snapshot.imageurl),
    );
    //child: Image.network(imageurl));
  }
}
