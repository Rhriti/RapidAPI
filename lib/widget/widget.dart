import 'package:flutter/material.dart';
import '../model.dart/recipemodel.dart';

class Mealcard extends StatelessWidget {
  Recipe snapshot;
  Mealcard(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
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
            child: Padding(
              padding: const EdgeInsets.all(7.0),
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
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Chip(
                    label: Text(snapshot.rating),
                    avatar: Icon(Icons.star, color: Colors.amber),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Chip(
                    label: Text(snapshot.time),
                    avatar: Icon(
                      Icons.timer,
                      color: Colors.amber,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
