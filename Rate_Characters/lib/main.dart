import 'package:flutter/material.dart';
import 'dart:async';

import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rate Shingeki Characters',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Rate Shingeki Characters',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []
    ..add(Dog('Eren Yeager', 'Human / Intelligent Titan', 'Soldier',
        'https://vignette.wikia.nocookie.net/shingekinokyojin/images/6/69/Eren_Yeager_character_image.png/revision/latest/scale-to-width-down/350?cb=20200910221354'))
    ..add(Dog('Mikasa Ackerman', 'Human', 'Soldier Officer',
        'https://vignette.wikia.nocookie.net/shingekinokyojin/images/f/f7/Mikasa_Ackerman_character_image.png/revision/latest/scale-to-width-down/350?cb=20190408130959'))
    ..add(Dog('Armin Arlert', 'Human / Intelligent Titan', 'Soldier Commander',
        'https://vignette.wikia.nocookie.net/shingekinokyojin/images/2/23/Armin_Arlert_character_image.png/revision/latest/scale-to-width-down/350?cb=20190408131322'))
    ..add(Dog('Levi Ackerman', 'Human', 'Soldier Squad Captain',
        'https://vignette.wikia.nocookie.net/shingekinokyojin/images/9/94/Levi_Ackerman_character_image.png/revision/latest/scale-to-width-down/350?cb=20190827170834'))
    ..add(
        Dog('Historia Reiss', 'Human', 'Queen', 'https://vignette.wikia.nocookie.net/shingekinokyojin/images/9/9f/Historia_Reiss_character_image.png/revision/latest/scale-to-width-down/350?cb=20191122211943'))
    ..add(Dog('Jean Kirstein', 'Human', 'Soldier Commanding Officer', 'https://vignette.wikia.nocookie.net/shingekinokyojin/images/f/f0/Jean_Kirstein_character_image.png/revision/latest/scale-to-width-down/350?cb=20190410005146'))
    ..add(Dog('Connie Springer', 'Human', 'Soldier Officer', 'https://vignette.wikia.nocookie.net/shingekinokyojin/images/3/3b/Connie_Springer_character_image.png/revision/latest/scale-to-width-down/350?cb=20200207074438'))
    ..add(Dog('Reiner Braun', 'Human / Intelligent Titan', 'Warrior Vice Captain', 'https://vignette.wikia.nocookie.net/shingekinokyojin/images/0/0f/Reiner_Braun_character_image.png/revision/latest/scale-to-width-down/350?cb=20190710044204'))
    ..add(Dog('Annie Leonhart', 'Human / Intelligent Titan', 'Warrior', 'https://vignette.wikia.nocookie.net/shingekinokyojin/images/2/2e/Annie_Leonhart_character_image.png/revision/latest/scale-to-width-down/350?cb=20200207074052'))
    ..add(Dog('Pieck Finger', 'Human / Intelligent Titan', 'Warrior', 'https://vignette.wikia.nocookie.net/shingekinokyojin/images/5/58/Pieck_Finger_character_image.png/revision/latest/scale-to-width-down/350?cb=20191007151947'))
    ..add(Dog('Gabi Braun', 'Human', 'Warrior', 'https://vignette.wikia.nocookie.net/shingekinokyojin/images/c/c5/Gabi_Braun_character_image.png/revision/latest/scale-to-width-down/350?cb=20190713113228'))
    ..add(Dog('Falco Grice', 'Human / Intelligent Titan', 'Warrior', 'https://vignette.wikia.nocookie.net/shingekinokyojin/images/9/93/Falco_Grice_character_image.png/revision/latest/scale-to-width-down/350?cb=20200207185232'))
    ..add(Dog('Onyankopon', 'Human', 'Soldier', 'https://vignette.wikia.nocookie.net/shingekinokyojin/images/8/82/Onyankopon_character_image.png/revision/latest?cb=20200108183440'));

  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDogFormPage();
    }));
    if (newDog != null) {
      initialDoggos.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage(
                  "https://static.zerochan.net/Attack.on.Titan.full.1417657.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: new Center(
            child: new DogList(initialDoggos),
          )),
    );
  }
}
