class MainWeather {

double ? temp ;
double ? feels_like ;
double ? temp_min ;
double ? temp_max ;
int ? pressure ;
int ? sea_level ;
int ? grnd_level ;
int ? humidity ;
double ? temp_kf ;

MainWeather({this.temp , this.feels_like , this.temp_min , this.temp_max ,
 this.pressure , this.sea_level ,this.grnd_level , this.humidity, this.temp_kf });

Map <String , dynamic> toJson(){
    return {
      'temp' : this.temp ,
      'feels_like' : this.feels_like ,
      'temp_min' : this.temp_min,
      'temp_max' : this.temp_max,
      'pressure' : this.pressure ,
      'sea_level': this.sea_level ,
      'grnd_level' : this.grnd_level , 
      'humidity' : this.humidity , 
      'temp_kf' : this.temp_kf 

    };
   }

   factory MainWeather.fromJson (Map<String , dynamic> json){
    return MainWeather(
      temp: json['temp'].toDouble(),
      feels_like: json['feels_like'].toDouble(),
      temp_min: json['temp_min'].toDouble(),
      temp_max: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      sea_level: json['sea_level'],
      grnd_level: json['grnd_level'],
      humidity: json['humidity'],
      temp_kf: json['temp_kf'].toDouble(),
    );
   }

}