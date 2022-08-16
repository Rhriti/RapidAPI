import 'package:flutter/material.dart';
import '../model.dart/recipemodel.dart';

class Mealcard extends StatelessWidget {
  Recipe snapshot;
  Mealcard(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 200,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.6),
                offset: Offset(0.0, 10),
                blurRadius: 10,
                spreadRadius: -6)
          ],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.25), BlendMode.multiply),
              fit: BoxFit.fill,
              image: NetworkImage(snapshot.imageurl))),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              snapshot.name,
              maxLines: 2,
              textAlign: TextAlign.center,
              //overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
