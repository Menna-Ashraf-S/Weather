import 'package:flutter_pro/model/listData.dart';
import 'package:flutter_pro/model/city.dart';

class AllData {

  String ? cod ;
  int ? message ;
  int ? cnt ;
  List <ListData> ? listData ;
  City ? city ;

  AllData ({this.cod , this.message , this.cnt , this.listData , this.city });

  Map <String , dynamic> toJson(){
    return {
      'cod' : this.cod ,
      'message' : this.message ,
      'cnt' : this.cnt ,
      'list' : List<dynamic>.from(listData!.map((x) => x.toJson())),
      'city' : city?.toJson()
    };
   }

   factory AllData.fromJson (Map<String , dynamic> json){
    return AllData(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      listData: List<ListData>.from(json['list'].map((x) => ListData.fromJson(x))),
      city: City.fromJson(json['city']),
    );
   }
}