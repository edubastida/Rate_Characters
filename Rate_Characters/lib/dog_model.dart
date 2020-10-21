import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;
  String fotourl;

  int rating = 5;

  Dog(this.name, this.location, this.description, this.fotourl);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      imageUrl = fotourl;
    } catch (exception) {
      print(exception);
    }
  }
}
