import 'dart:convert';
import 'package:weatherapp/model.dart/recipemodel.dart';

import './model.dart/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './widget/widget.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Future<List<Recipe>> _getitem() async {
    return Recipeapi.getDate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Snapshots'),
        ),
        body: FutureBuilder(
            future: _getitem(),
            builder: (_, AsyncSnapshot<List<Recipe>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  
                  return Scrollbar(
                    thickness: 20,
                    thumbVisibility: true,
                    showTrackOnHover: true,
                    interactive: true,
                    child: ListView.builder(
                      //cacheExtent: 400,
                      padding: EdgeInsets.all(8),
                      itemCount: snapshot.data!.length,
                      itemBuilder:(_,index){
                        return Mealcard(snapshot.data![index]);
                      } 
                    ),
                  );
                } else
                  return AlertDialog(
                    title: Text('ERROR'),
                    content: Text(snapshot.error.toString()),
                  );
              } else
                return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
