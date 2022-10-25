class Wind {

double ? speed ;
int ? deg ;
double ? gust ;

Wind ({this.speed , this.deg , this.gust});

  Map <String , dynamic> toJson(){
    return {
      'speed' : this.speed ,
      'deg' : this.deg  ,
      'gust' : this.gust
    };
   }

   factory Wind.fromJson (Map<String , dynamic> json){
    return Wind(
      speed: json['speed'].toDouble(),
      deg: json['deg'],
      gust: json['gust'].toDouble(),
      
    );
   }
}