class Weather {
  int ? id ;
  String ? main ;
  String ? description ;
  String ? icon ;

   Weather ({this.id , this.main ,  this.description , this.icon});

   Map <String , dynamic> toJson(){
    return {
      'id' : this.id ,
      'main' : this.main ,
      'description' : this.description ,
      'icon' : this.icon 
    };
   }

   factory Weather.fromJson (Map<String , dynamic> json){
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon']
    );
   }
}