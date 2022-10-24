import 'package:flutter/material.dart';
import 'package:flutter_pro/model/allData.dart';
import 'package:http/http.dart';
import 'dart:convert';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      
      home: Home(),
        
    );
  }
}

class Home  extends StatefulWidget {
 
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < Home > {


  Future<AllData> getWeather() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder
      (future: getWeather(),
        builder: ((context, snapshot) {
          if (snapshot.hasData){
            print(snapshot.data) ;

          }
          else if (snapshot.hasError){
            print(snapshot.error);
          }
          return Center(child: CircularProgressIndicator(),);
        })),
    );

  }
  
  }
  

  
	