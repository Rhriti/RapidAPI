import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screen/homescreen.dart';
import './model.dart/api.dart';

void main() {
  runApp(Homepage());
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          home: MyApp(),
          routes: {
            '/home': (_) => MyApp(),
          },
        ),
        providers: [ChangeNotifierProvider(create: (_) => Recipeapi())]);
  }
}
