class Sys {

  String ? pod ;

Sys ({this.pod});

 Map <String , dynamic> toJson(){
    return {
      'pod' : this.pod ,
    };
   }

   factory Sys.fromJson (Map<String , dynamic> json){
    return Sys(
      pod: json['pod'],
    );
   }
}