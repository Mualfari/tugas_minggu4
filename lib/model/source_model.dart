import 'package:flutter/cupertino.dart';

class Source{
  late String name;
  late String id;


  Source({required this.id,required this.name});

  factory Source.fromMap(Map<String,dynamic> json){
    return Source(id: json['id'], name: json['name']);
  }
}