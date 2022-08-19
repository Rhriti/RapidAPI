import 'package:weatherapp/model.dart/recipemodel.dart';
import '../model.dart/api.dart';
import 'package:flutter/material.dart';
import '../widget/widget.dart';
import '../widget/addmeal.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Future<List<Recipe>> getitems(Recipeapi provider) async {
    print(provider.getDate());
    return provider.getDate();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Recipeapi>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return Additem();
                    });
              },
              icon: Icon(Icons.add))
        ],
        title: Text(
          'Meals',
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder(
          future: getitems(provider),
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
                      itemBuilder: (_, index) {
                        return Mealcard(snapshot.data![index]);
                      }),
                );
              } else
                print(snapshot.data);
              return AlertDialog(
                title: Text('ERROR'),
                content: Text(snapshot.error.toString()),
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
