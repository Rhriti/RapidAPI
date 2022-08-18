import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'recipemodel.dart';

class Recipeapi {
  List<Recipe> names = [];

  static addnew(){

  }

  Future<List<Recipe>> getDate() async {
    final url = Uri.parse('https://yummly2.p.rapidapi.com/feeds/list');
    var data = await http.get(url, headers: {
      'X-RapidAPI-Key': '38563f21b7mshfc4879230ff5f21p1a2c79jsn301e7618bd25',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });

    final jsonData = json.decode(data.body); //Map<String,dynamic>

    
    String display;
    String rating;
    String time;
    String image;

    for (Map ele in jsonData['feed']) {
      print('chalu biisii');
      try {
        display = ele['display']['displayName'].toString();
        print(display);
      } catch (e) {
        display = '';
      }
      try {
        rating = ele['content']['details']['rating'].toString();
        print(rating);
      } catch (e) {
        rating = '';
      }
      try {
        time = ele['content']['details']['totalTime'].toString();
        print(time);
      } catch (e) {
        time = '';
      }
      try {
        image = ele['display']['images'][0].toString();
        print(image);
      } catch (e) {
        image = '';
      }
      if (display != '' && rating != '' && time != '' && image != '') {
        names.add(Recipe(display, rating, time, image));
      }
    }

    return names;
  }
}
