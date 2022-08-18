import 'package:flutter/material.dart';

class Additem extends StatefulWidget {
  @override
  State<Additem> createState() => _AdditemState();
}

class _AdditemState extends State<Additem> {
  final _keys = GlobalKey<FormState>();

  TextEditingController imageurl = TextEditingController(text: '');
  late FocusNode imageF;

  @override
  void initState() {
    imageF = FocusNode();
    imageF.addListener(() {
      setState(() {
        //print(imageurl);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    imageF.dispose();
    imageurl.dispose();
    super.dispose();
  }

  void save() {
    bool flag = _keys.currentState!.validate();
    if (flag == false) {
      print('flase;');
      return;
    }
    ;

    _keys.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
        //title: Text('damend'),
        content: Form(
            key: _keys,
            child: Column(
              children: [
                TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) return 'Enter Meal name';
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text(
                        'Meal name',
                      ),
                      icon: Icon(
                        Icons.set_meal_outlined,
                      ),
                    )),
                TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val!.isEmpty) return 'Enter number';
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text(
                        'rating',
                      ),
                      icon: Icon(
                        Icons.star,
                      ),
                    )),
                TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val!.isEmpty) return "Enter Time";
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text(
                        'total time',
                      ),
                      icon: Icon(
                        Icons.timer,
                      ),
                    )),
                TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) return 'Enter valid url';
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (x) {
                      save();
                    },
                    focusNode: imageF,
                    controller: imageurl,
                    decoration: InputDecoration(
                      label: Text('imageUrl'),
                      icon: Icon(
                        Icons.image,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 150,
                  decoration: BoxDecoration(border: Border.all()),
                  height: 100,
                  child: (imageurl.text == '')
                      ? Icon(Icons.image_not_supported)
                      : Image.network(
                          imageurl.text,
                          errorBuilder: (c, o, st) {
                            return Icon(Icons.image_not_supported);
                          },
                        ),
                )
              ],
            )));
  }
}
