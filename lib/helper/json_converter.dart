import 'dart:convert';

class JsonConverter{
  Map<String,dynamic> getJson(Map<String, dynamic> data){
    return  {"jsonData":jsonEncode(data)};
  }
}