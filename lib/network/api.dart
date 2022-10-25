import 'package:flutter_pro/model/allData.dart';
import 'package:http/http.dart';
import 'dart:convert';

class API{
  static Future<AllData> getWeather() async {
    Response futureWeather = await get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=mansoura&appid=4261b578ff01f660107e3a96e509fbc6#'));
    if (futureWeather.statusCode <= 299 && futureWeather.statusCode >= 200 ){
      final Map<String , dynamic> jsonBody = jsonDecode(futureWeather.body);
      AllData alldata =AllData.fromJson(jsonBody);
      return alldata ;
    }
    else {
      throw Exception('can not get weather ${futureWeather.body}');
    }
  }
}