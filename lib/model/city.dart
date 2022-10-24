import 'package:flutter_pro/model/coord.dart';

class City {

int ? id ;
String ? name ;
Coord ? coord ;
String ? country ;
int ? population ;
int ? timezone ;
int ? sunrise ;
int ? sunset ;

City({this.id  ,this.name , this.coord , this.country , this.population , this.timezone , this.sunrise ,this.sunset });

Map <String , dynamic> toJson(){
    return {
      'id' : this.id ,
      'name' : this.name ,
      'coord' : coord?.toJson() ,
      'country' : this.country,
      'population' : this.population ,
      'timezone': this.timezone ,
      'sunrise' : this.sunrise , 
      'sunset' : this.sunset 

    };
   }

   factory City.fromJson (Map<String , dynamic> json){
    return City(
      id: json['int'],
      name: json['name'],
      coord: Coord.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'] 
    );
   }

}