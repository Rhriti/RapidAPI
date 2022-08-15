import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final x = _getDate();
    //print(x);
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
            future: _getDate(),
            builder: (_, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView(
                    children: List.generate(
                        snapshot.data!.length,
                        (index) => ListTile(
                              title: Text(snapshot.data![index]),
                            )),
                  );
                } else
                  return AlertDialog(
                    title: Text('ERROR'),
                    content: Text(snapshot.error.toString()),
                  );
              } else
                return CircularProgressIndicator();
            }),
      ),
    );
  }

  Future<List<String>> _getDate() async {
    final url = Uri.parse('https://yummly2.p.rapidapi.com/feeds/list');
    var data = await http.get(url, headers: {
      'X-RapidAPI-Key': '38563f21b7mshfc4879230ff5f21p1a2c79jsn301e7618bd25',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });

    final jsonData = json.decode(data.body); //Map<String,dynamic>

    List<String> names = [];

    for (Map ele in jsonData['feed']) {
      //print(ele);
      if (ele == null ||
          ele['display'] == null ||
          ele['display']['displayName'] == null) continue;
      names.add(ele['display']['displayName']);
    }
    //print(names);
    return names;
  }
}
