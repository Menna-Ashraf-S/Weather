import 'package:flutter_pro/model/clouds.dart';
import 'package:flutter_pro/model/mainWeather.dart';
import 'package:flutter_pro/model/sys.dart';
import 'package:flutter_pro/model/weather.dart';
import 'package:flutter_pro/model/wind.dart';
import 'package:path/path.dart';

class ListData {

  int ? dt ;
  MainWeather ? mainWeather ;
  List  <Weather>  ? weather ; 
  Clouds ? clouds ;
  Wind ? wind ;
  int ? visibility ;
  int ? pop ; 
  Sys ? sys ;
  String ? dt_txt ;

  

  ListData({this.dt , this.mainWeather , this.weather , this.clouds , this.wind ,
   this.visibility , this.pop , this.sys , this.dt_txt });

  Map <String , dynamic> toJson(){
    return {
      'dt' : this.dt ,
      'main' : mainWeather?.toJson() ,
      'weather' : List<dynamic>.from(weather!.map((e) => e.toJson ())),
      'clouds' : clouds?.toJson() ,
      'wind' : wind?.toJson(),
      'visibility' : this.visibility ,
      'pop' : this.pop ,
      'sys' : sys?.toJson(),
      'dt_txt' : this.dt_txt 
      
    };
   }

   factory ListData.fromJson (Map<String , dynamic> json){
    return ListData(
      dt: json['id'],
      mainWeather: MainWeather.fromJson(json['main']),
      weather: List<Weather>.from(json['weather'].map((x) => Weather.fromJson(x))),
      clouds: Clouds.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'],
      pop: json['pop'],
      sys: Sys.fromJson(json['sys']),
      dt_txt: json['dt_txt'],
      
    );
   }

}